class AdministrationController < ApplicationController
  
  before_filter   :login_administrator
  
  def index
    @administrator ||= Administrator.find_by_username(session[:user_id])
    @administrators = @administrator.children
  end

  def login_administrator
    if not logged_in?
      redirect_to login_path
    else
      @administrator = Administrator.find_by_username(session[:user_id])
      if not @administrator
        flash[:error] = _('Access denied for user <em>%s</em>. Please log in with an user which has an administration-account.') % session[:user_id]
        redirect_to login_path
      end
    end
  end
  
end
