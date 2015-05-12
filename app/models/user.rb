class User < ActiveRecord::Base

  has_many :user_events
  has_many :created_events, class_name: "Event"
  has_many :attended_events, through: :user_events, source: :event

  validates :first_name, :last_name, :birthday, :password_hash, :username, :presence => true

  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, :username, :uniqueness => true

  validates :password_hash, :username, length: { minimum: 6, maximum: 20 }

  validates :profile_picture, presence: true, allow_nil: true

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
