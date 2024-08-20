class Brand < ApplicationRecord
  has_many :models, -> { order(:id) }
end
