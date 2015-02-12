Artist.destroy_all
Event.destroy_all
Review.destroy_all
User.destroy_all

admin = User.create(:first_name => 'Julia', :last_name => 'Ryan', :username => 'admin', :email => 'juliaryan@y7mail.com', :password => 'kittens', :password_confirmation => 'kittens', :is_admin => true)