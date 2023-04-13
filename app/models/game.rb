require "matrix"

class Game < ApplicationRecord
  def similarity_score(game)
    ##
    # cos theta = a dot b / maginute a X maginute b
    ##
    other_game_vector = Vector[game.board_score, game.card_score, game.party_score, game.players_score]

    dot_product = game_vector.dot(other_game_vector)
    magnitude_product = game_vector.magnitude * other_game_vector.magnitude

    (dot_product / magnitude_product) * 100
  end

  def user_similarity_score(user_profile_vector)
    dot_product = game_vector.dot(user_profile_vector)
    magnitude_product = game_vector.magnitude * user_profile_vector.magnitude

    (dot_product / magnitude_product) * 100
  end

  def game_vector
    Vector[board_score, card_score, party_score, players_score]
  end
end
