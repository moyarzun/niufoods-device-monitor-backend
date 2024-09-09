Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :status_logs
    end
  end
  namespace :api do
    namespace :v1 do
      resources :status
    end
  end
  namespace :api do
    namespace :v1 do
      resources :devices
    end
  end
  namespace :api do
    namespace :v1 do
      resources :locations
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
