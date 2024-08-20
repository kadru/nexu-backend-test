class AddUniqueIndexOverModelNameAndBrand < ActiveRecord::Migration[7.2]
  def change
    add_index :models, %i[name brand_id], unique: true
  end
end
