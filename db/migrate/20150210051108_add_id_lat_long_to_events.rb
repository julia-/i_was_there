class AddIdLatLongToEvents < ActiveRecord::Migration
  def change
    add_column :events, :id_event, :integer
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
