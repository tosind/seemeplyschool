json.array!(@principals) do |principal|
  json.extract! principal, :id, :first, :name, :last, :name, :titles, :biography
  json.url principal_url(principal, format: :json)
end
