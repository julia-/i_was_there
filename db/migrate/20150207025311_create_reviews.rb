class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end
end
