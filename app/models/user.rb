# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  username        :string
#  email           :string
#  image           :text
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default("false")
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, inverse_of: :user
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
end
