# == Schema Information
#
# Table name: stories
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  author       :string(255)
#  link         :string(255)
#  published_at :date
#  text         :text
#  magazine_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
