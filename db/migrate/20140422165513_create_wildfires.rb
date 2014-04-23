class CreateWildfires < ActiveRecord::Migration
  def change
    create_table :wildfires do |t|
      t.string :size
      t.string :type
      t.date :date
      t.string :location_id
    end
  end
end
