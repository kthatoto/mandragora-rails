Rails.application.routes.draw do

  root "top#index"
  post "slack" => "top#slack"
end
