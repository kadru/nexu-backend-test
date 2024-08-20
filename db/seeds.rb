# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

models_data = JSON.load(Rails.root.join("models.json"))

models_data.each do |model_data|
  brand = Brand.find_or_create_by!(name: model_data.fetch("brand_name"))

  model = Model.new(
    name: model_data.fetch("name"),
    average_price: model_data.fetch("average_price"),
    brand:
  )
  # some models from the json file don't have an average price above 100,000 so with the purpuse to only populate the db
  # we let them to save.
  model.save(validate: false)
end
