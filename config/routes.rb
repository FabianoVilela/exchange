Rails.application.routes.draw do
  root 'home#index'
  get 'exchange', to: 'home#exchange'
end