Rails.application.routes.draw do
 
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resource :profile, only: [:show, :edit, :update, :destroy] do
    get :logout, on: :member
  end

  resources :publications, only: [:create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Abre uma pagina com o email enviado
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root "home#index"

end
