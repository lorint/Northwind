json.array!(@customers) do |customer|
  json.extract! customer, :id, :company_name, :contact_name, :contact_title, :address, :city, :region, :postal_code, :country, :phone, :fax
  json.url customer_url(customer, format: :json)
end
