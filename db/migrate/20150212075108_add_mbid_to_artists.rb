class AddMbidToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :mbid, :string
  end
end
