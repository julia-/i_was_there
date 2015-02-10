# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :date
#  venue_name :string
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#  title      :string
#  headliner  :string
#  artist     :string
#  city       :string
#  country    :string
#  id_event   :string
#  latitude   :string
#  longitude  :string
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :artists
  has_many :reviews
end
