Rails.application.routes.draw do
  root 'welcome#index'

  get "/auth/twitch", as: :login
  get "/auth/twitch/callback", to: "sessions#create"
end
