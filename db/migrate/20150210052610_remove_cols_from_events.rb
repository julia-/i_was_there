class RemoveColsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :id_event, :integer
    remove_column :events, :latitude, :float
    remove_column :events, :longitude, :float
    remove_column :events, :venue_location, :string
  end
end
