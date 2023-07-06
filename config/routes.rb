Rails.application.routes.draw do
 
  devise_for :users, controllers:{
    sessions: 'users',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Abre uma pagina com o email enviado
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: [:show]

  resources :livros

  root "home#index"

end
