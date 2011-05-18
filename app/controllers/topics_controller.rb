class TopicsController < ApplicationController
  before_filter :authorize, :only => [:new]
  def new
    @node = Node.find(params[:node_id])
    @topic = @node.topics.build
  end
  
  def create
    @node = Node.find(params[:node_id])
    @topic = @node.topics.build(params[:topic])
    @topic.user_id = session[:user_id]

    respond_to do |format|
      if @topic.save
        flash[:notice] = 'Topic was successfully created.'
        format.html { redirect_to node_topic_url(@node, @topic) }
        format.xml  { render :xml => @node, :status => :created, :location => @node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @node.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @user = User.find_by_id(session[:user_id])
    #@node = Node.find(params[:node_id])
    @topic = Topic.find(params[:id])
    @title = @topic.title
    # add up views
    @topic.views = @topic.views + 1
    @topic.save
    #= @topic.posts.build
    respond_to do |format|
      format.html
      format.iphone
    end
  end
end