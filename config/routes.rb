Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :status_logs, only: %i[index show create]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :status, only: %i[index show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :devices, only: %i[index show create update]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :locations, only: %i[index show create update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
