class ModelsController < ApplicationController
  def index
    models = Model.filter_prices(greater: params[:greater], lower: params[:lower])
    render json: ModelSerializer.new(models)
  end

  def update
    model = Model.find params[:id]

    if model.update average_price: params[:average_price]
      render status: :ok,
             json: ModelSerializer.new(model)
    else
      render status: :unprocessable_entity,
             json: {
               error_message: model.errors.full_messages.to_sentence
             }
    end
  end
end
