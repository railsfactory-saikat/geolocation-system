# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get "generate_token", to: "users/users#generate_token"
  resources :geolocations, except: :update do
    get "list", to: "geolocations#list", on: :collection
  end
end
