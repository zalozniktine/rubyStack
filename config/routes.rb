Rails.application.routes.draw do

  get 'activity', to: 'pages#activity'
  get 'activity/questions', to: 'pages#questions'
  get 'activity/answers', to: 'pages#answers'
  get 'policy', to: 'pages#policy'
  get 'lajk', to: 'answers#like'

  


  devise_for :people, controllers: { omniauth_callbacks: 'people/omniauth_callbacks'#, sessions: 'people/sessions' 
  }
  resources :questions do
    resources :answers, only: [:create, :destroy] do
      #resources :likes, only: [:create, :destroy]
      member do
        patch "upvote", to: "answers#upvote"
      end
    end
  end



  #get 'home/index'



  root "questions#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
