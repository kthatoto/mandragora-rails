Rails.application.routes.draw do
  scope :api do
    get "weather" => "api#weather"
    get "slack"   => "api#slack"
    get "log"     => "api#log"
  end
end
