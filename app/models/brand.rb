class Brand < ApplicationRecord
  has_many :models, -> { order(:id) }
  validates :name, uniqueness: true
end
