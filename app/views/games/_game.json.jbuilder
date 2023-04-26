json.extract! game, :id, :title, :description, :rating, :playTime, :created_at, :updated_at
json.url game_url(game, format: :json)
