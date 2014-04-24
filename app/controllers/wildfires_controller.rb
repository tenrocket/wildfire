class WildfiresController < ApplicationController

	def index
		if params[:search]
	    @wildfires = Wildfire.search(params[:search])
	  else
	    @wildfires = Wildfire.all
	  end
	end

	def search
		@wildfires = Wildfire.search(params[:search])
		render wildfires_path
	end

	def new
		@new_wildfire = Wildfire.new
	end

	def create
		@new_wildfire = Wildfire.new(wildfire_params)
		if @new_wildfire.save
			redirect_to wildfires_path
		else 
			redirect_to new_wildfire_path
		end
	end

	def show
		@chosen_wildfire = Wildfire.find(params[:id])
	end

	def download_wildfire_photo
		@wildfire = Wildfire.find(params[:id])
		file = @wildfire.wildfire_photo
		send_file file.path
	end

	def destroy
		#DELETE 'sale_items'
		@chosen_wildfire = Wildfire.find(params[:id])
		@deleted_wildfire = Wildfire.find(params[:id])

		if @deleted_wildfire.destroy
			redirect_to wildfires_path
		end
	end

	private

	def wildfire_params
		params.require(:wildfire).permit!
	end

end
