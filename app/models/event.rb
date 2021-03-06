class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :user_events
  has_many :attendees, through: :user_events, source: :user
  has_many :event_categories
  has_many :categories, through: :event_categories

  # validates :name, :address, :starts_at, :ends_at, :presence => true

  # validates :lat, :long, :presence => true, :allow_nil => true
end
