Rails.application.routes.draw do

  get 'activity', to: 'pages#activity'

  devise_for :people, controllers: {
    sessions: 'people/sessions'
  }
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
  #get 'home/index'
  root "questions#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
