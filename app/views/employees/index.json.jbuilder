json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :title, :title_of_courtesy, :birth_date, :hire_date, :address, :city, :region, :postal_code, :country, :home_phone, :extension, :notes
  json.url employee_url(employee, format: :json)
end
