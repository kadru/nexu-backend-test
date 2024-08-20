class CreateModels < ActiveRecord::Migration[7.2]
  def change
    create_table :models do |t|
      t.references :brand
      t.string :name
      t.integer :average_price

      t.timestamps
    end
  end
end
