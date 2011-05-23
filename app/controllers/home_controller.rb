class HomeController < ApplicationController
  def index
    @nodes = Node.all
    @hotnodes = Node.all(:include => :topics).sort_by { |p| p.topics.count }
    @user = User.find_by_id(session[:user_id])

    @users = User.all
    #@topics = Topic.all(:include => :posts, :order => 'topics.created_at DESC,posts.created_at DESC')
    @topics = Topic.all(:include => :posts).sort_by { |p| p.posts.last.nil? ? p.created_at: p.posts.last.created_at}.reverse
    @posts = Post.all.reverse
    @title="Home"
    respond_to do |format|
      format.html # index.html.erb
      format.iphone
    end
  end

end
