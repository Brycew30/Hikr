class Trail < ApplicationRecord
  belongs_to :location
  accepts_nested_attributes_for :location

  validates :name, presence: true
  validates :type, presence: true
  validates :length, presence: true
  validates :description, presence: true
  # validates :location, presence: true
end
