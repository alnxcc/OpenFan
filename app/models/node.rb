class Node < ActiveRecord::Base
  validates_presence_of :title
  has_many  :posts
  has_many  :topics
end
