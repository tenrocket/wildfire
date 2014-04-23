class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :wildfires, :type, :fire_type
  	rename_column :wildfires, :date, :fire_date
  end
end
