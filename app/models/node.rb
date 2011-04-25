class Node < ActiveRecord::Base
  has_many  :post
  has_many  :topic
end
