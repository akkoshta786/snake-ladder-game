# == Schema Information
#
# Table name: paths
#
#  id          :integer          not null, primary key
#  destination :integer          not null
#  source      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :integer
#
# Indexes
#
#  index_paths_on_board_id                             (board_id)
#  index_paths_on_board_id_and_source_and_destination  (board_id,source,destination) UNIQUE
#  index_paths_on_source                               (source) UNIQUE
#
class Path < ApplicationRecord
  # Validations
  validates :source, presence: true, uniqueness: { scope: :board_id }
  validates :destination, presence: true, uniqueness: { scope: %i[board_id source] }

  # Associations
  belongs_to :board, inverse_of: :paths
end
