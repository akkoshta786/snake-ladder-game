class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.integer :number_of_players, null: false, default: 2
      t.integer :player_turn
      t.boolean :active, null: false, default: true
      t.string :winner

      t.timestamps
    end
  end
end
