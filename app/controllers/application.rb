# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'gettext/rails'




class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  helper_method :logged_in?, :is_admin?, :get_user, :user_id, :authenticate_admin, :authenticate
  
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '626c3fce15ce794f11ae3134bd1dea34'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def authenticate
    if !logged_in? 
      session[:initial_uri] ||= request.env['REQUEST_URI']
      redirect_to login_path
    end
  end

  
  def authenticate_admin
    if not is_admin?
      reset_session
      flash[:error] = _('Your user is not registered for administration. Please log in with an administrator account' )
      session[:initial_uri] = request.env['REQUEST_URI']
      redirect_to login_path
    end
  end
  
  
  # return the session's user_id (user.username)
  def user_id
    @uesr_id ||= session[:user_id]
  end
  
  def get_user
    @current_user ||= (user_id ? User.find_by_username(user_id) : nil)
  end
  
  # return true if user's keywords include 'admin'
  def is_admin?
    begin
      @is_admin ||= get_user.is_admin?
    rescue
      false
    end
  end
  

  # logged_in?
  # Returns true if a user_id is set within the session-cookie
  def logged_in?
    return ( ( session[:user_id] != nil && session[:ip] == request.env['REMOTE_ADDR'] ) )
  end  
  
  def crypt_password(plain,salt=nil)
     salt ||= random_string(2)
     "{CRYPT}" + plain.crypt(salt)
  end

 
  
end
