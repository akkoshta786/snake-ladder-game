# == Schema Information
#
# Table name: boards
#
#  id                :integer          not null, primary key
#  active            :boolean          default(TRUE), not null
#  number_of_players :integer          default(2), not null
#  player_turn       :integer
#  winner            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Board < ApplicationRecord
  # Associations
  has_many :players, inverse_of: :board
  has_many :paths, inverse_of: :board

  def player_move(dice_throw_count)
    return 1 unless active

    return 2 if dice_throw_count <= 0 || dice_throw_count > 6

    current_player = Player.find(player_turn)
    position = [100, current_player.position + dice_throw_count].min
    jumper = paths.find_by(source: position)

    while jumper.present?
      position = jumper.destination
      jumper = paths.find_by(source: position)
    end

    current_player.update!(position:)
    update!(player_turn: current_player.next)

    return { response: "position of #{current_player.name} is #{position}" } unless position == 100

    update!(active: false)
    update!(winner: current_player.name)

    { response: "#{current_player.name} wins" }
  end

  def init
    update!(active: true)
    update!(winner: nil)
    initialize_players
    initialize_paths
  end

  def initialize_players
    (1..number_of_players).each do |i|
      players.find_or_initialize_by(name: "Player#{i}").tap do |player|
        player.position = 0
        player.save!
      end
    end
    update!(player_turn: players.first.id)
  end

  def initialize_paths
    snake_ladders = [[5, 20], [24, 59], [26, 84], [32, 53], [33, 6], [44, 21], [46, 89], [60, 80], [72, 12], [79, 48],
                     [94, 66]]

    snake_ladders.each do |src, dest|
      paths.find_or_create_by!(source: src, destination: dest)
    end
  end
end
