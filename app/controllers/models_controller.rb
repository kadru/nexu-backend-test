class ModelsController < ApplicationController
  def index
    render json: ModelSerializer.new(
      Brand.find(params[:brand_id]).models
    )
  end
end
