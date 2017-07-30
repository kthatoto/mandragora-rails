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

  def slack
    slack = Slack::Incoming::Webhooks.new "https://hooks.slack.com/services/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"
    slack.post "alert from rails!"
    success = {status: "今は動作停止させてます！"}
    render json: success
  end

end
