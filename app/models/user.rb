class User < ActiveResource::Base
  self.site = "http://remote_client:remote@localhost:3002"
  
  def self.find_by_username(username)
    @user ||= User.find(:first, :conditions => ['username = ?', username])
  end
  
end