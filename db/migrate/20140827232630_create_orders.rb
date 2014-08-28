class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.date :required_date
      t.date :shipped_date
      t.references :ship_via, index: true
      t.decimal :freight
      t.string :ship_name
      t.string :ship_address
      t.string :ship_city
      t.string :ship_region
      t.string :ship_postal_code
      t.string :ship_country
      t.string :customer_code
      t.references :customer, index: true
      t.references :employee, index: true

      t.timestamps
    end
  end
end
