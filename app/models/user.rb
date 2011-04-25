class User < ActiveRecord::Base
  validates_presence_of :username, :password, :email
  validates_length_of   :username, :minimum => 3
  has_many  :topics
  has_many  :posts
end
