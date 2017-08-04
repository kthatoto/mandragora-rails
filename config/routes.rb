Rails.application.routes.draw do
  scope :api do
    get "weather"  => "api#weather"
    get "slack"    => "api#slack"
    get "log"      => "api#log"
    get "announce" => "api#announce"
    get "scream"   => "api#scream"
    get "solar"    => "api#solar"
  end

  scope :moistures do
    get "index"  => "moistures#index"
    get "create" => "moistures#create"
  end
end
