class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :node
  has_many   :post
end
