class ChangeColumnLocationId < ActiveRecord::Migration
  def change
  	change_column :wildfires, :location_id, :integer
  end
end
