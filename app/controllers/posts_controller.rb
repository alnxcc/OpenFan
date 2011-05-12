class PostsController < ApplicationController
  before_filter :authorize, :only => [:new]
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    @post.user_id = session[:user_id]

    respond_to do |format|
      if @topic.save
        flash[:notice] = 'Topic was successfully created.'
        format.html { redirect_to topic_url(@topic) }
        format.xml  { render :xml => @node, :status => :created, :location => @node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end
end