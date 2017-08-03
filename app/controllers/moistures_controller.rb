class MoisturesController < ApplicationController

  def index
    moistures = Moisture.all
  end

  def create
    moisture = Moisture.new(value: params[:value])
    t = Time.zone.now
    current_time = Time.zone.local(t.year, t.month, t.day, t.hour, 30 * (t.min/30).to_i, 0)
    if Moisture.find_by(time_label: current_time)
      render json: {status: false, msg: "duplicated..."}
      return
    end
    save_weather
    moisture.time_label = current_time
    if moisture.save
      render json: {status: true,  msg: "success!"}
    else
      render json: {status: false, msg: "failed..."}
    end
  end

  private
    def save_weather
      t = Time.zone.now
      current_time = Time.zone.local(t.year, t.month, t.day, t.hour, 30 * (t.min/30).to_i, 0)

      if Weather.find_by(time_label: current_time)
      else
        uri  = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=84b7ad6bb8746ca5e0ac13a4181d6261')
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)

        weather  = result["weather"].first["main"]
        temp     = result["main"]["temp"]
        humidity = result["main"]["humidity"]

        Weather.create(weather: weather, temperature: temp, humidity: humidity, time_label: current_time)
      end
    end

end
