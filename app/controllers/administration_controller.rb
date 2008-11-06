class AdministrationController < ApplicationController
  
  before_filter   :login_administrator, :except => :get_ip
  
  def index
    @administrator ||= Administrator.find_by_username(session[:user_id])
    @administrators = @administrator.children
    @servers        = Server.find_all_by_user_id(@administrator)
  end
  
  
  def login_administrator
    
    if not session[:user_id]
      redirect_to "/login"
    else
      @administrator = Administrator.find_by_username(session[:user_id])
      if not @administrator
        flash[:error] = _('Access denied for user <em>%s</em>. Please log in with an user which has an administration-account.') % session[:user_id]
        redirect_to login_path
      end
    end
  end
  
  # get the ip of params[:dns_name]
  def get_ip
    f = File::popen("host #{params[:dns_name]}|sed 's/.*has address //g'","r")
    @ip_address = f.read
    f.close
    render :layout => false
  end
  
end
