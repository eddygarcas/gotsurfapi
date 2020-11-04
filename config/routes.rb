Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
      get '/spots/:point', to: "spots#show", as: 'spots_to_show'
      get '/spots/', to: "spots#points", as: 'spots_points'
      resources :spots do
        resources :swells
      end
    end
  end

  post "/slack/command", to: "slack/commands#create"

end
