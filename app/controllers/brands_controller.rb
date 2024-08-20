class BrandsController < ApplicationController
  def index
    render json: BrandSerializer.new(Brand.order(:id).all)
  end

  def create
    brand = Brand.new(name: params[:name])
    if brand.valid?
      render status: :created,
             json: BrandSerializer.new(
              Brand.create!(name: params[:name])
             )
    else
      render status: :unprocessable_entity,
             json: {
              error_message: brand.errors.full_messages.to_sentence
             }
    end
  end
end
