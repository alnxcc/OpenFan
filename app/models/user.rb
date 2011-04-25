class User < ActiveRecord::Base
  has_many  :topic
  has_many  :post
end
