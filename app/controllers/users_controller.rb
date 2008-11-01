class UsersController < ApplicationController
  before_filter :authenticate
  
  
  def index
    begin
      @users = User.find(:all)
    rescue Exception => e
      raise "Remote request failed with #{e.to_s}"
    end
  end
  
  def show
    @user = User.find(params[:id])    
  end
  
  
end