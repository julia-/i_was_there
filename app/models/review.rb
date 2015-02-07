# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :artists, :through => :events
end
