class AddColumnToWildfires < ActiveRecord::Migration
  def change
  	add_column :wildfires, :fire_size, :integer
  end
end
