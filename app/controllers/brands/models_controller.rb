class Brands::ModelsController < ApplicationController
  def index
    render json: ModelSerializer.new(
      Brand.find(params[:brand_id]).models
    )
  end

  def create
    brand = Brand.find_by id: params[:brand_id]
    if brand.nil?
      render status: :not_found,
                    json: {
                      error_message: "brand doesn't exists"
                    }
      return
    end

    model = brand.models.create(
      name: params[:name],
      average_price: params[:average_price]
    )

    if model.valid?
      render status: :created,
             json: ModelSerializer.new(model)
    else
      render status: :unprocessable_entity,
             json: {
               error_message: model.errors.full_messages.to_sentence
             }
    end
  end
end
