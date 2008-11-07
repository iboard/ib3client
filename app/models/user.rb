class User < ActiveResource::Base
  self.site = "http://remote_client:remote@localhost:3002"
  
  
  def self.not_administrators(but_me)
    User.find(:all).find_all { |u|
      u.username == but_me || Administrator.find_by_username(u.username).nil?
    }
  end
  
  def self.find_by_username(search_name)
    @user ||= User.find(:all).detect { |u| u.username == search_name }
  end
  
end