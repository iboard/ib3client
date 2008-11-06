class SessionController < ApplicationController
  def new
    if logged_in?
      render :text => (_('You are logged in as <em>%s</em>!' ) % session[:user_id]) + 
                      " (<a href=#{logout_path}>#{_('logout')}</a>)", :layout => 'application'
    else
      render :layout => 'application'
    end
  end

  def destroy
    reset_session
    flash[:notice] = _('Good bye!')
    redirect_to root_path
  end

  def verify_login
    username = params[:username]
    password = params[:password]

    begin
      @user = User.get( :remote_authenticate, :id => "#{username}:#{password}" )
      if @user
        flash[:notice] = _('Logged in successfully')
        session[:user_id] = username
        session[:ip]      = request.env['REMOTE_ADDR']
        redirect_to session[:initial_uri] || root_path
        return false
      end
    rescue Exception => e
      flash[:error] =  "#{e}"
      @user = nil
      redirect_to login_path
      return false
    end
        
    flash[:notice] = _('Log in failed')
    redirect_to login_path
    return false
  end
  
  private
  def authenticate_user(user,pass)
    u = User.find_by_username(user)
    return false if not u
       
    if u 
      salt = u.crypted_password[0..1] 
      mycrypt = pass.crypt(salt)
      if mycrypt == u.crypted_password
        return true
      end
      return false
    else
      flash[:error] = _('Login failed')
      return false
    end
  end

end
