SmartVending::Application.routes.draw do
  root  :to => 'dashboard#dashboard'
  get "graphics/esolar"
  get "graphics/cnxtrasp"
  get "graphics/psimulado"
#  devise_for :users
 # devise_for :users, :skip => [:registrations, :sessions] do
  devise_for :users, :skip => [:registrations, :sessions] 
  as :user do
      get '/users/sign_in' => 'devise/sessions#new', :as => :new_user_session
      post '/users/sign_in' => 'devise/sessions#create', :as => :user_session
     get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
     #delete '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
      delete 'users/:id' => 'devise/registrations#destroy', :as => 'user_destroy_registration'
    end
#  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :machines

  resources :alarms

  resources :customers

  # root  'static_pages#home'
#  root  'dashboard#dashboard'
#  root  :to => "home#index"
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'  
  match '/grid', to: 'static_pages#grid', via: 'get'  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
