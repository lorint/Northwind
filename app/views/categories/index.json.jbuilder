json.array!(@categories) do |category|
  json.extract! category, :id, :category_name, :description
  json.url category_url(category, format: :json)
end
