json.array!(@snails) do |snail|
  json.extract! snail, :id, :name, :description, :speed, :endurance, :motivation
  json.url snail_url(snail, format: :json)
end
