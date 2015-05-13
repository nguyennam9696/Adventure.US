class Category < ActiveRecord::Base
  has_many :event_categories
  has_many :events, through: :event_categories
  has_many :user_categories
  has_many :users, through: :user_categories
  # validates :adventure_types, presence: true
end
