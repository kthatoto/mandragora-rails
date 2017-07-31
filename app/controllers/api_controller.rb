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
    success = {status: "alerted!"}
    render json: success
  end

  def log
    log = []
    weathers = ["sunny", "rainy", "clouding"]
    30.times{|i|

      humidity = Random.rand 100
      date = {year: 2017,month: 7,day: i,hour:12,minute:36,second:53}
      log.push({date:date,weather:weathers[rand weathers.count],humidity:humidity})
    }
    render json: log
  end

  def announce
    weathers_jp = ["晴れ", "曇り", "雨"]
    weathers_en = ["Clear", "Clouds", "Rain"]

    uri  = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=84b7ad6bb8746ca5e0ac13a4181d6261')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    weather  = result["weather"].first["main"]
    temp     = result["main"]["temp"]
    humidity = result["main"]["humidity"]

    result=`say 東京の天気。#{weathers_jp[weathers_en.index(weather)]}`
    result=`say 気温は。#{(5*(temp-32)/9).to_i}度`
    result=`say 湿度は。#{humidity}%。です。`
    render json: []
  end
end






