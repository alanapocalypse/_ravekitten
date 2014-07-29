json.array!(@cards) do |card|
  json.extract! card, :id, :title, :image, :event_date
  json.url card_url(card, format: :json)
end
