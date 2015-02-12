class AddPhotoToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :photo, :string
  end
end
