json.array!(@games) do |game|
  json.extract! game, :id, :player1, :player2, :player1_score, :player2_score
  json.url game_url(game, format: :json)
end
