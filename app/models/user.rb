class User < ApplicationRecord
  has_many :reviews
  has_many :trails, through: :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  validates :username, presence: true, uniqueness: { case_sensitive: false }
        validate :validate_username
        attr_writer :login

        def login
            @login || username || email
        end

        def validate_username
            errors.add(:username, :invalid) if User.where(email: username).exists?
        end

        def self.find_for_database_authentication(warden_conditions)
            conditions = warden_conditions.dup
            if login = conditions.delete(:login)
                where(conditions.to_hash).where(['lower(username) = :value OR lower(email) = :value', {value: login.downcase}]).first
            elsif conditions.key?(:username) || conditions.key?(:email)
                where(conditions.to_h).first
            end
        end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.username = provider_data.info.name
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
