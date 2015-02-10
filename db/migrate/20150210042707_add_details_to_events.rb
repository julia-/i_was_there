class AddDetailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :headliner, :string
    add_column :events, :artist, :string
    add_column :events, :city, :string
    add_column :events, :country, :string
  end
end
