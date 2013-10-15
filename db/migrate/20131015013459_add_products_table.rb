class AddProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
    end

    create_table :products_users do |t|
      t.integer :product_id
      t.integer :user_id
    end

    add_index :products_users, :product_id
    add_index :products_users, :user_id
  end
end
