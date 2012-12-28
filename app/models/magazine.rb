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

class Magazine < ActiveRecord::Base
  attr_accessible :name, :website

  validates_presence_of :name, :website
  validates_format_of :website, :with => URI::ABS_URI, :message => 'is not a valid URL'
end
