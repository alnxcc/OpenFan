class HomeController < ApplicationController
  def index
    @nodes = Node.all
    @user = User.find_by_id(session[:user_id])
    @topics = Topic.all
    @posts = Post.all
  end

end
