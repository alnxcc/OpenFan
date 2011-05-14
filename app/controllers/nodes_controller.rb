class NodesController < ApplicationController
  before_filter :authorize, :only => [:new]
  def show
    @node = Node.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    @title = @node.title
  end
  
  def new
    @node = Node.new
  end
  
  def create
    @node = Node.new(params[:node])

    respond_to do |format|
      if @node.save
        flash[:node] = 'User was successfully created.'
        format.html { redirect_to(@node) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end