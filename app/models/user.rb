class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true

  PASSWORD_REQUIREMENTS = /\A 
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x

  validates :password, :presence => true, format: { with: PASSWORD_REQUIREMENTS, message: "must be 8 or more characters, including lower and upper case letters and at least one number and symbol" }

  before_save :encrypt_password
  before_create :set_admin

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private
  # def password_required?
  #   new_record? ? super : false
  # end  

  def set_admin
    self.admin = true unless User.exists?
  end

end