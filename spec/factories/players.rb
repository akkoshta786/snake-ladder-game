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
FactoryGirl.define do
  factory :player do
    
  end
end
