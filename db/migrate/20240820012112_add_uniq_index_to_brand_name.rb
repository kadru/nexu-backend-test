class AddUniqIndexToBrandName < ActiveRecord::Migration[7.2]
  def change
    add_index :brands, :name, unique: true
  end
end
