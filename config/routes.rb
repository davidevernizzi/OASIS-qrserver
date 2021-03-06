Qrserver::Application.routes.draw do
  get "bussoleno/index"
  get "bussoleno/new"
  get "bussoleno/export", to: 'bussoleno#export'
  get "bussoleno/:id", to: 'bussoleno#show'
  post "bussoleno/new", to: 'bussoleno#create'
  get "bussoleno/edit/:id", to: 'bussoleno#edit'
  post "bussoleno/edit/:id", to: 'bussoleno#editbussoleno'
  get "bussoleno/print/:id", to: 'bussoleno#print'
  get "bussoleno/print_small/:id", to: 'bussoleno#print_small'

  get '/badges/bussoleno', to: 'badges#bussoleno'
  post '/badges/bussoleno', to: 'badges#newbussoleno'


  resources :presences


  resources :details


  resources :badges do
  	resources :details
	resources :presences
  end


  resources :books


  resources :libraries do
  	resources :books
  end


  resources :attributes


  #resources :attributes

  resources :resources do
  	resource :attributes
  end


  get '/presences/list/:id', to: 'presences#list'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
root :to => 'bussoleno#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
