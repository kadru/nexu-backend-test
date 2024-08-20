class Model < ApplicationRecord
  belongs_to :brand
  validates :name, uniqueness: { scope: :brand_id }
  validates :average_price, numericality: { allow_nil: true, greater_than: 100_000 }
end
