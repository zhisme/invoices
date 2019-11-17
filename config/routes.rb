# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :invoices, only: :index
      resources :settings, only: %i[index] do
        collection do
          put :change
        end
      end
    end
  end
end
