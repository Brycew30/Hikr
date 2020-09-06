class Trail < ApplicationRecord
  has_many :trails
  validates :name, presence: true
end
