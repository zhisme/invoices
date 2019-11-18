Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: :index
      resources :companies, only: %i[create update]
    end
  end
end
