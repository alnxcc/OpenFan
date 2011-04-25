class User < ActiveRecord::Base
  validates_presence_of :username, :plainpassword, :email
  validates_uniqueness_of :username
  validates_length_of   :username, :in => 3..12
  validates_length_of   :plainpassword, :in => 3..12
  has_many  :topics
  has_many  :posts
  
  attr_accessor :plainpassword
  validates_confirmation_of :plainpassword
  
  def plainpassword_confirmation
    @plainpassword_confirmation
  end
  
  def plainpassword_confirmation=(pwd)
    @plainpassword_confirmation = pwd
    return if pwd.blank?
    self.password = User.encrypted_password(self.plainpassword_confirmation)
  end
  
  def self.encrypted_password(password)
    Digest::MD5.hexdigest(password)
  end
  
  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user
      expected_password = encrypted_password(password)
      if user.password != expected_password
        user = nil
      end
    end
    user
  end
end
