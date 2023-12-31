Rails.application.routes.draw do
  
  namespace :public do
    get 'user_ocrs/new'
  end
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
}

  devise_for :admins, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope module: :public do
    
    controller :homes do
      root to: "homes#top"
    end
    
    controller :users do
      get 'users/mypage' => "users#mypage"
      get '/users/information/edit' => "users#edit"
      patch '/users/information' => "users#update"
      get 'users/unsubscribe' => "users#unsubscribe"
      patch 'users/withdraw' => "users#withdraw"
      resources :users do
        controller :userservices do
          resources :userservices, only: [:show, :create, :update, :destroy]
        end
      end
    end
    
    controller :user_ocrs do
      get 'user_ocrs/new' => "user_ocrs#new"
      resources :user_ocrs, only: [:create]
    end
    
  end
  
  namespace :admin do
    
    controller :homes do
      root to: "homes#top"
    end
    
  end
  
  
end
