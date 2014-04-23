class Wildfire < ActiveRecord::Base
	belongs_to :location

	def self.search(query)
  	where('fire_type LIKE ? OR fire_size LIKE ? OR fire_date LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")

  	# Location.joins(:wildfires).where('locations.state LIKE ? OR locations.city LIKE ? OR wildfires.fire_date LIKE ? OR wildfires.fire_type LIKE ? OR wildfires.fire_size LIKE ? OR wildfires.location_id LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end

