class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :discount
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
