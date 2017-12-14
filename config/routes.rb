Rails.application.routes.draw do
  root to: "top#index"

  get "/signout" => "sessions#destroy"
  get "/auth/:provider/callback" => "sessions#create"
end
