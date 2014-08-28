json.array!(@orders) do |order|
  json.extract! order, :id, :order_date, :required_date, :shipped_date, :ship_via_id, :freight, :ship_name, :ship_address, :ship_city, :ship_region, :ship_postal_code, :ship_country, :customer_id, :employee_id
  json.url order_url(order, format: :json)
end
