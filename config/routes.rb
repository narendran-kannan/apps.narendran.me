# frozen_string_literal: true

Rails.application.routes.draw do
  resources :wb_canvas, param: :name
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 
  #  For Pictionary Game

  # get '/pict', '#'
  #
  #   For Online Whiteboard
  # get 'wb/:id', to: 'canvas#show'
  constraints({subdomain: ROUTECONFIG[Rails.env]['greenify']['subdomain'], domain: ROUTECONFIG[Rails.env]['greenify']['domain']}) do
    get '/', to: 'greenify/volunteers#new'
    get '/join', to: 'greenify/volunteers#new'
    post '/join', to: 'greenify/volunteers#create'
  end

  constraints(domain: ROUTECONFIG[Rails.env]['bio_domain']) do
    get '/', to: 'bio#home'

    get 'admin/login', to: 'sessions#new'
    post 'admin/login', to: 'sessions#admin_login'
    namespace 'admin' do
      resources :blogs
      resources :categories
      get '/dashboard', to: 'dashboard#index'
    end

    # Error Pages
    get '/401', to: 'pages#unauthorized'
    get '/404', to: 'pages#not_found'
  end
end

