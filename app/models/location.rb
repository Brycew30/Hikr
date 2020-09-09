class Location < ApplicationRecord
  has_many :trails
  validates :name, presence: true

  def location_attributes(location_attributes)
    location_name = location_attributes["name"]
    # unless location_name.blank?
    #   location = Location.find_or_create_by(name: location_name)
    #   self.location = locatino
    # end
  end
end
