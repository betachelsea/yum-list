Rails.application.routes.draw do
  root to: "top#index"

  get "auth/:provider/callback" => "sessions#create"
  delete "logout" => "sessions#destroy"
end
