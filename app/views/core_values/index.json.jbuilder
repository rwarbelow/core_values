json.array!(@core_values) do |core_value|
  json.extract! core_value, :id
  json.url core_value_url(core_value, format: :json)
end
