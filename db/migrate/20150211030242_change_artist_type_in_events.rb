class ChangeArtistTypeInEvents < ActiveRecord::Migration
  def change
    change_column :events, :artist, :text
  end
end
