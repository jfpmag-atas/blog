Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get "sign_in" => "users#sign_in"
  get "sign_out" => "users#sign_out"
  # get "change_password" => "authentication#change_password"
  # get "forgot_password" => "authentication#forgot_password"
  get "sign_up"		=> "users#sign_up"
  post "new_user"	=> "users#new"
  # get "password_sent" => "authentication#password_sent"
  post "sign_in" => "users#login"
  get	 "new_tag" => "tags#create"
  post "new_tag" => "tags#add"
  get	 "tagged_articles/:id", to: "tags#tagged_articles", as: 'tagged_articles'
  get	 "articles_by_user/:user_id", to: "articles#articles_by_user", as: 'articles_by_user'
  get	 "reply/:id", to: "comments#reply", as: 'reply'
  post "reply/:comment_id", to: "comments#add_reply", as: "add_reply"
  delete "reply/:comment_id/:reply_id", to: "comments#delete_reply", as: "delete_reply"
  # post "new_user" => "authentication#register"

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
