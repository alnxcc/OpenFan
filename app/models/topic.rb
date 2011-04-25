class Topic < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :user
  belongs_to :node
  has_many   :posts
end
