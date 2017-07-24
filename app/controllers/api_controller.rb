class ApiController < ApplicationController

  def weather
    uri  = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=84b7ad6bb8746ca5e0ac13a4181d6261')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    weather  = result["weather"].first["main"]
    temp     = result["main"]["temp"]
    humidity = result["main"]["humidity"]

    render json: {weather: weather, temp: temp, humidity: humidity}
  end
end
