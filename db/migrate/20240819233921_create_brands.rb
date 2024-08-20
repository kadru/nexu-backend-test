class CreateBrands < ActiveRecord::Migration[7.2]
  def change
    create_table :brands do |t|
      t.integer :average_price
      t.string :name

      t.timestamps
    end
  end
end
