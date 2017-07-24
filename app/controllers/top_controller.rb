class TopController < ApplicationController

  def index
  end

  def slack
    slack = Slack::Incoming::Webhooks.new "https://hooks.slack.com/services/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"
    # slack.post "alert from rails!"
    success = {status: "今は動作停止させてます！"}
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
end
