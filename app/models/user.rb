class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  has_many(
    :authored_secrets,
    :class_name => "Secret",
    :foreign_key => :author_id
  )

  has_many(
    :received_secrets,
    :class_name => "Secret",
    :foreign_key => :recipient_id
  )

  has_many :victim_friendships,
  class_name: "Friendship",
  foreign_key: :stalker_id,
  primary_key: :id

  has_many :stalker_friendships,
  class_name: "Friendship",
  foreign_key: :victim_id,
  primary_key: :id

  has_many :victims, through: :victim_friendships, source: :victim
  has_many :stalkers, through: :stalker_friendships, source: :stalker

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :username, :presence => true

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end