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
require 'rails_helper'

RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
