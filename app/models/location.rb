class Location < ApplicationRecord
  has_many :trails
  validates :name, presence: true

end
