class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :wildfires, :size
  end
end
