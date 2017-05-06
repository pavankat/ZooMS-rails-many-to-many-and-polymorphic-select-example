json.array!(@shows) do |show|
  json.extract! show, :id, :title, :lead_actor, :rating
  json.url show_url(show, format: :json)
end
