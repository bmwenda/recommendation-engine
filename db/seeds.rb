require "json"
require_relative "games_array_demo"

games = get_games

games.each do |game|
  Game.create(
    name: game[:name],
    image: game[:image],
    price: game[:price],
    max_players: game[:max_players],
    min_players: game[:min_players],
    play_time: game[:play_time],
    description: game[:description],
    genre: game[:genre],
    rating: game[:rating],
    rank: game[:rank],
    board_score: game[:board_score],
    players_score: game[:players_score],
    card_score: rand(10),
    party_score: rand(10)
  )
end

puts "Done creating games..."

User.create(
  name: "Test",
  board_score: 5,
  card_score: 6,
  party_score: 3,
  players_score: 3
)

puts "created test user"
