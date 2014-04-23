class LocationsController < ApplicationController

	def index
		if params[:search]
	    @locations = Location.search(params[:search])
	  else
	    @locations = Location.all
	  end
	end

	def new
		@new_location = Location.new
	end

	def create
		@new_location = Location.new(location_params)
		if @new_location.save
			redirect_to locations_path
		else 
			redirect_to new_location_path
		end
	end

	def show
		@chosen_location = Location.find(params[:id])
	end

	def select_deleted_location
		@chosen_location = Location.find(params[:id])
		@deleted_location = Location.find(params[:id])
	end

	def destroy
		#DELETE 'sale_items'
		@chosen_location = Location.find(params[:id])
		@deleted_location = Location.find(params[:id])

		if @deleted_location.destroy
			redirect_to locations_path
		end
	end

	private

	def location_params
		params.require(:location).permit!
	end
end
