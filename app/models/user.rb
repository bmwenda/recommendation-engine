require "matrix"

class User < ApplicationRecord
  def profile
    Vector[board_score, card_score, party_score, players_score]
  end

  def update_profile(new_rating_vector)
    # formula: Vnew = ((n x Vold) + Vitem ) / n + 1
    # Create an avg value for each user's attribute

    new_board_score = (total_reviews * profile[0] + new_rating_vector[0]) / (total_reviews + 1)
    new_card_score = (total_reviews * profile[1] + new_rating_vector[1]) / (total_reviews + 1)
    new_party_score = (total_reviews * profile[2] + new_rating_vector[2]) / (total_reviews + 1)
    new_players_score = (total_reviews * profile[3] + new_rating_vector[3]) / (total_reviews + 1)

    new_profile = Vector[new_board_score, new_card_score, new_party_score, new_players_score]

    update(total_reviews: self.total_reviews += 1)
    new_profile
  end

  def similarity_score(game)
    game_vector = Vector[game.board_score, game.card_score, game.party_score, game.players_score]

    dot_product = profile.dot(game_vector)
    magnitude_product = profile.magnitude * game_vector.magnitude

    (dot_product / magnitude_product) * 100
  end

  def game_recommendations
    recommended_games = []

    Game.all.each do |game|
      score = similarity_score(game)
      recommended_games << game.as_json.merge({ "similarity" => score })
    end
    recommended_games.sort_by { |hash| -hash["similarity"] }
  end
end
