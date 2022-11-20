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
#  index_paths_on_board_and_source_and_destination  ("board", "source", "destination") UNIQUE
#  index_paths_on_board_id                          (board_id)
#  index_paths_on_source                            (source) UNIQUE
#
FactoryGirl.define do
  factory :path do
    
  end
end
