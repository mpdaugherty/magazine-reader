# == Schema Information
#
# Table name: magazines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  website    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MagazineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
