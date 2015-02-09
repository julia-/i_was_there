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
#  image      :text
#

class Review < ActiveRecord::Base
  belongs_to :user, inverse_of: :reviews
  belongs_to :event, inverse_of: :reviews
  has_many :artists, :through => :events
end
