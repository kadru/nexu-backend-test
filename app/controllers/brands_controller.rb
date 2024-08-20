class BrandsController < ApplicationController
  def index
    render json: BrandSerializer.new(Brand.order(:id).all)
  end
end
