json.array!(@neighborhoods) do |neighborhood|
  json.extract! neighborhood, :id, :city_id, :name
  json.url neighborhood_url(neighborhood, format: :json)
end
