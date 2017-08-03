class MoisturesController < ApplicationController

  def index
    moistures = Moistures.all
  end

  def create
    moisture = Moisture.new(value: params[:value])
    if moisture.save
      render json: {status: "success!"}
    else
      render json: {status: "failed..."}
    end
  end

end
