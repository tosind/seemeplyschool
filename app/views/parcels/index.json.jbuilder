json.array!(@parcels) do |parcel|
  json.extract! parcel, :id, :geometry, :build_name, :address, :city_id, :zipcode
  json.url parcel_url(parcel, format: :json)
end
