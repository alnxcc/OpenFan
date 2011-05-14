class HomeController < ApplicationController
  def index
    @nodes = Node.all
    @user = User.find_by_id(session[:user_id])
    @users = User.all
    @topics = Topic.all(:order => "updated_at DESC")
    @posts = Post.all
    @title="Home"
  end

end
