Rails.application.routes.draw do
  root "top#index"
  get "log" => "top#log"
  scope :api do
    get "weather" => "api#weather"
    get "slack"   => "api#slack"
  end
end
