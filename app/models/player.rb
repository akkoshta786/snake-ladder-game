# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
# Indexes
#
#  index_players_on_board_id  (board_id)
#
class Player < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: { scope: :board_id }
  validates :position, presence: true

  # Associations
  belongs_to :board, inverse_of: :players

  def next
    if id == board.players.last.id
      board.players.first.id
    else
      board.players.order(id: :asc).find_by('id > ?', id).id
    end
  end
end
