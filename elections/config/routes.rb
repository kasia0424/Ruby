Elections::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :roles_users


  resources :roles


  #get "user_sessions/new"

  #get "user_sessions/create"

  #get "user_sessions/destroy"

  resources :users, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  resource :user_sessions, :only => [:new, :create, :destroy]
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  get "users/new"

  get "users/create"

  get "users/edit"
  get "users/show"

  get "users/update"
  get "users/role"
  #
  get "users/index"
  get "users/:id/add" => "users#add", :as => :users_add

  resources :votes
    get 'votes/:id/listconsti' => 'constituencies#listconsti', :as => :votes_listconsti


  resources :voivodeships
   get 'voivodeships/:id/frekwencja' => 'voivodeships#frekwencja', :as => :voivodeships_frekwencja
   get 'voivodeships/:id/results' => 'voivodeships#results', :as => :voivodeships_results
   get 'voivodeships/:id/invalid' => 'voivodeships#invalid', :as => :voivodeships_invalid


  resources :constituencies
    get 'constituencies/:id/listconst' => 'constituencies#listconst', :as => :constituencies_listconst
    get 'constituencies/:id/frekwencja' => 'constituencies#frekwencja', :as => :constituencies_frekwencja
    get 'constituencies/:id/add' => 'constituencies#add_user', :as => :constituencies_add


  resources :committees_voivodeships
    get 'committees_voivodeships/:id/listc' => 'committees_voivodeships#listc', :as => :committees_voivodeships_listc
    get 'committees_voivodeships/:id/listv' => 'committees_voivodeships#listv', :as => :committees_voivodeships_listv


  resources :committees

  root :to => 'user_sessions#new'#'voivodeships#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
