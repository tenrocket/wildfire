class Location < ActiveRecord::Base
	has_many :wildfires

	# Location.joins(SELECT locations.state, wildfires.fire_date FROM locations INNER JOIN wildfires ON locations.id = wildfires.locations_id)

	# Location.joins(:wildfires).where("locations.state = ? OR locations.city = ? OR wildfires.fire_date = ? OR wildfires.fire_type = ? OR wildfires.fire_size = ? OR wildfire.location_id = ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")

	def self.search(query)
  	where('city LIKE ? OR state LIKE ?', "%#{query}%", "%#{query}%") 
	end
	# validates_presence_of :state

	# def self.search(search)
	# 	if search
	# 		find(:all, :conditions => ['state LIKE ?', "%#{params[:search]}%"])
	# 	else
	# 		find(:all)
	# 	end
end
