class MoisturesController < ApplicationController

  def index
    moistures = Moistures.all
  end

  def create
    moisture = Moisture.new(value: params[:value])
    if moisture.save
      render json: {status: true,  msg: "success!"}
    else
      render json: {status: false, msg: "failed..."}
    end
  end

end
