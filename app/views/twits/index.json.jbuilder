json.array!(@twits) do |twit|
  json.extract! twit, :id, :title, :content
  json.url twit_url(twit, format: :json)
end
