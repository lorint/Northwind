json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :id, :unit_price, :quantity, :discount, :order_id, :product_id
  json.url order_detail_url(order_detail, format: :json)
end
