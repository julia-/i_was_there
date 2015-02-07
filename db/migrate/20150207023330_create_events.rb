class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :venue_name
      t.string :venue_location
      t.text :image
      t.timestamps
    end
  end
end
