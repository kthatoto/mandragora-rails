class TopController < ApplicationController

  def index
  end

  def slack
    slack = Slack::Incoming::Webhooks.new "https://hooks.slack.com/services/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"
    # slack.post "alert from rails!"

    success = {status: "OK!"}
    render json: success
  end
end
