class Wildfire < ActiveRecord::Base
	belongs_to :location

	mount_uploader :wildfire_photo, WildfirePhotoUploader

	# def self.search(query)
  	# where('fire_type LIKE ? OR fire_size LIKE ? OR fire_date LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")

  	# joins(:location).where('locations.state LIKE ? OR locations.city LIKE ? OR wildfires.fire_date LIKE ? OR wildfires.fire_type LIKE ? OR wildfires.fire_size LIKE ? OR wildfires.location_id LIKE ?', "#{query}", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	# end

	def self.search(params)

		type 		= params[:fire_type]
		size 		= params[:fire_size]
		date 		= params[:fire_date]
	 location = params[:location_id]

		search = Wildfire.all

		if type.present?
			search = search.where('type LIKE ?', "%#{type}")
		end

		if size.present?
			search = search.where('size LIKE ?', "%#{size}%")
		end

		if date.present?
			search = search.where('date LIKE ?', "%#{date}%")
		end

		if location.present?
			search = joins.where('location.state LIKE ? OR location.city LIKE ?', "%#{location}", "%#{location}")
		end

		search
		
	end
end
