Rails.application.routes.draw do
  root "top#index"
  get  "slack" => "top#slack"
  scope :api do
    get "weather" => "api#weather"
  end
end
