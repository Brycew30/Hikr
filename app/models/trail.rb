class Trail < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :location

  validates :name, presence: true
  validates :path_type, presence: true
  validates :length, presence: true
  validates :description, presence: true
  validates :location_id, presence: true

  scope :search, -> (query) {where("name LIKE ?", "%" + query + "%") }
  scope :alphabetical_order, -> {order(:name)}


end
