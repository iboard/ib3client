ActionController::Routing::Routes.draw do |map|
  
  map.resources :servers

  map.administration "/administration", :controller => 'administration', :action => 'index'
  map.get_ip         "/get_ip", :controller => 'administration', :action => 'get_ip', :method => :get

  map.resources :administrators, :member => { :servers => :get }

  map.resources :users

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.login   '/login', :controller => 'session', :action => 'new'
  map.logout  '/logout', :controller => 'session', :action => 'destroy'
  map.root    :controller => nil
end
