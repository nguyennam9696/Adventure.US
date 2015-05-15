require 'faker'

User.delete_all
Event.delete_all
Category.delete_all

users = 30.times.map do
  User.create!( :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :username => Faker::Internet.user_name,
    :email => Faker::Internet.email,
    :number => Faker::PhoneNumber.cell_phone,
    :birthday => Date.today - 15.years - rand(20000).days,
    :profile_picture => Faker::Avatar.image("my-own-slug"),
    :password => 'password' )
end


hookups = Category.create!( :adventure_type => "Hook Ups")
hike = Category.create!( :adventure_type => "Hiker Adventures")
learn = Category.create!( :adventure_type => "Study Buddy")
buddy = Category.create!( :adventure_type => "Travel/Buddy Adventurors")
shopping = Category.create!( :adventure_type => "Shopping Buddy")
competition = Category.create!( :adventure_type => "Competitions")
volunteer = Category.create!( :adventure_type => "Volunteer Adventures")
startup = Category.create!( :adventure_type => "Make a company together")
neighborhood = Category.create!( :adventure_type => "Neighborhood Adventures")
street = Category.create!( :adventure_type => "Street Adventures")
college = Category.create!( :adventure_type => "College Adventures")
party = Category.create!( :adventure_type => "Parties")

Category.all.each do |category|
  10.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time = start_time + (1 + rand(6)).hours

  event = Event.create!( :user_id => users[rand(users.length)].id,
    :name => Faker::Company.name,
    :description => Faker::Lorem.paragraph(2),
    :starts_at => start_time,
    :ends_at => end_time,
    :address => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    :lat => Faker::Address.latitude,
    :long => Faker::Address.longitude )
    category.events << event
  end
end

all_events = Event.all
users.each do |user|
  random_events = all_events.sample(rand(2..10))
  until random_events.length == 0
    event = random_events.pop
    user.create_events << event
  end
  random_events = all_events.sample(rand(2..10))
  until random_events.length == 0
    event = random_events.pop
    user.attend_events << event
  end
end

all_categories = Category.all
users.each do |user|
  random_categories = all_categories.sample(rand(1..12))
  until random_categories.length == 0
    category = random_categories.pop
    user.categories << category
  end
end
