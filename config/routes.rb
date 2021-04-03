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
end
