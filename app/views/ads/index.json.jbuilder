json.array!(@ads) do |ad|
  json.extract! ad, :id, :title
  json.url ad_url(ad, format: :json)
end
