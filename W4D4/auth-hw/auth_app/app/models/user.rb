class User < ApplicationRecord
  before_validation :ensure_session_token

  validates :username, presence: true
  validates :session_token, presence: true
  validates :password_digest, presence: {message: "Passwork cannot be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}


  def self.find_by_credentials(username, password)
    user = Username.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::url_safe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
