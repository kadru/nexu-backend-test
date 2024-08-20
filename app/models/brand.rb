class Brand < ApplicationRecord
  has_many :models, -> { order(:id) }
  validates :name, uniqueness: true

  def average_price
    models.average(:average_price).to_f
  end
end
