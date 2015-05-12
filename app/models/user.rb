class User < ActiveRecord::Base

  has_many :user_events
  has_many :created_events, class_name: "Event"
  has_many :attended_events, through: :user_events, source: :event

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(entered_password)
    self.password == entered_password
  end

end
