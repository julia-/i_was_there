# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  genre      :string
#  city       :string
#  country    :string
#  bio        :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base
  has_and_belongs_to_many :events

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end
end
