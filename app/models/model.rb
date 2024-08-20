class Model < ApplicationRecord
  belongs_to :brand
  validates :name, uniqueness: { scope: :brand_id }
  validates :average_price, numericality: { allow_nil: true, greater_than: 100_000 }

  scope :filter_prices, ->(lower: nil, greater: nil) {
     models = order_by_id
     models = models.greater_average_price(greater) if greater
     models = models.lower_average_price(lower) if lower

     models
  }
  scope :greater_average_price, ->(quantity) { where("average_price > ?", quantity) }
  scope :lower_average_price, ->(quantity) { where("average_price < ?", quantity) }
  scope :order_by_id, -> { order(:id) }
end
