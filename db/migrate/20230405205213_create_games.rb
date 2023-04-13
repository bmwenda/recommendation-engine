class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.float :price
      t.integer :max_players
      t.integer :min_players
      t.integer :play_time
      t.string  :description
      t.string :genre
      t.float :rating
      t.integer :rank
      t.integer :board_score
      t.integer :players_score
      t.integer :card_score
      t.integer :party_score

      t.timestamps
    end
  end
end
