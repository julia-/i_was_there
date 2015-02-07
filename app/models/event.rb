# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  date           :date
#  venue_name     :string
#  venue_location :string
#  image          :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Event < ActiveRecord::Base
  has_and_belongs_to_many :artists
  has_many :reviews
end
