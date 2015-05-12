# Twilio
# Geocode
# Google Maps
# webRTC
# MobileFirst

it "allows a user to log in" do
  visit '/'
  click_on 'Login'
  fill_in 'Username', with: 'test'
  fill_in 'Password', with: 'password'
  expect(page.body).to include "welcome"
end

it "allows a user to sign up" do
end

it "allows user to be an adventuror" do
end

it "allows user to be an adventuree" do
end

it "gets the users location" do
end

it "display google map" do
end

it "display nearby events near the user's location" do
end

it "display nearby events on a google map" do
end

it "show drop pins on google map" do
end

it "allows a user to click on the google pins" do
end

it "after click google pins show the event" do
end