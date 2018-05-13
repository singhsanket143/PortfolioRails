Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # get 'pages/home'
  get 'about-me' => 'pages#about'
  get 'contact' => 'pages#contact'
  resources :blogs
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
