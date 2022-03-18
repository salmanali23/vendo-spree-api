class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :cart_id, unique: true, null: false
      t.index :cart_id
      t.json :data
      t.json :metadata
      t.timestamps
    end
  end
end
