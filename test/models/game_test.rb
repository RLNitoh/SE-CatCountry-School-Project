# == Schema Information
#
# Table name: games
#
#  id                   :bigint           not null, primary key
#  CatName              :string
#  CatNameDistractor1   :string
#  CatNameDistractor2   :string
#  CatNameDistractor3   :string
#  CatOrigin            :string
#  CatOriginDistractor1 :string
#  CatOriginDistractor2 :string
#  CatOriginDistractor3 :string
#  CatPicture           :string
#  GameID               :integer
#  NameAnswer           :string
#  OriginAnswer         :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
