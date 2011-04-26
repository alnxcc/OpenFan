class HomeController < ApplicationController
  def index
    @nodes = Node.all
    
    @topics = Topic.all
  end

end
