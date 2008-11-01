ActionController::Routing::Routes.draw do |map|

  map.resources :users

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.login   '/login', :controller => 'session', :action => 'new'
  map.logout  '/logout', :controller => 'session', :action => 'destroy'
  map.root    :controller => nil
end
