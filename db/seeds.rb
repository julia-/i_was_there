Artist.destroy_all
Event.destroy_all
User.destroy_all
Review.destroy_all

a1 = Artist.create(:name => 'Neutral Milk Hotel')
a2 = Artist.create(:name => 'Beirut')
a3 = Artist.create(:name => 'Conor Oberst')

e1 = Event.create(:date => '3 November 2014')
e2 = Event.create(:date => '4 April 2014')
e3 = Event.create(:date => '4 March 2014')

u1 = User.create(:name => 'Charlotte')
u2 = User.create(:name => 'Seb')
u3 = User.create(:name => 'Frankie')

r1 = Review.create(:title => 'Working title')
r2 = Review.create(:title => 'Another working title')
r3 = Review.create(:title => 'One more working title')

# u1 = User.create(:name => 'Charlotte', :password => 'kittens', :password_confirmation => 'kittens')
# u2 = User.create(:name => 'Seb', :password => 'kittens', :password_confirmation => 'kittens')
# u3 = User.create(:name => 'Frankie', :password => 'kittens', :password_confirmation => 'kittens')
# admin = User.create(:name => 'admin', :password => 'kittens', :password_confirmation => 'kittens', :is_admin => true)