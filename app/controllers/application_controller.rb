# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_iphone_format
  before_filter :authorize, :only => [:logout]
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  @user = User.new
  def set_iphone_format
    if is_iphone_request?
      request.format = :iphone
    end
  end
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please login"
      redirect_to :controller => 'users', :action => 'login'
  end
end
  def is_iphone_request?
    request.user_agent =~ /(Mobile\/.+Safari)/
  end
end
