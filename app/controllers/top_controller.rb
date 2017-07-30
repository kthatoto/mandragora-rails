class TopController < ApplicationController

  def index
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
end
