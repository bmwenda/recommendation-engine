class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :board_score
      t.integer :card_score
      t.integer :party_score
      t.integer :players_score
      t.integer :total_reviews, default: 0

      t.timestamps
    end
  end
end
