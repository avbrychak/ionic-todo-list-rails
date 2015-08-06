Rails.application.routes.draw do
   
  namespace :api, defaults: { format: :json } do
    resources :lists do 
      resources :tasks do 
        put 'complete', on: :member
      end
    end     
  end 
  # root 'welcome#index'
end
