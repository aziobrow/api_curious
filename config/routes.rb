Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:username', to: 'github_users#show', as: 'basic_info'
  get '/:username/orgs', to: 'github_users#orgs', as: 'organizations'
end
