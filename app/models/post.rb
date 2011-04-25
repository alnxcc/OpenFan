class Post < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user
  belongs_to :topic
  belongs_to :node
end
