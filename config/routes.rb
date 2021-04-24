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
  if ENV['RAILS_ENV'] == 'production'
    constraints(domain: 'narendran.me') do
      get '/', to: 'bio#home'
    end
  else
    get '/', to: 'bio#home'
  end
end
