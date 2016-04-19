Rails.application.routes.draw do
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

  resources :users do
    collection do
      post :sign_up_from_app
      post :login_from_app
    end
  end

  get    '/login'   => 'sessions#new', as: :login
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy', as: :logout

  resources :informations do
    collection do
      get :jiuyexinxi
      get :gongyougushi
      get :jinengpeixun
      get :anquanxinxi
      get :uploadfile
      post :uploadfile
      post :create_from_app
    end
  end

  namespace :api do
    get "/informations/get_all" => "informations#get_all"
    get "/informations/jiuyexinxi" => "informations#jiuyexinxi"
    get "/informations/gongyougushi" => "informations#gongyougushi"
    get "/informations/jinengpeixun" => "informations#jinengpeixun"
    get "/informations/anquanxinxi" => "informations#anquanxinxi"
  end
end
