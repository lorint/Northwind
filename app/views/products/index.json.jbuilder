json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :quantity_per_unit, :unit_price, :units_in_stock, :units_on_order, :reorder_level, :discontinued, :supplier_id, :category_id
  json.url product_url(product, format: :json)
end
