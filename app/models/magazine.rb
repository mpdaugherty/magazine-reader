class Magazine < ActiveRecord::Base
  attr_accessible :title, :website

  validates_presence_of :title, :website
  validates_format_of :website, :with => URI::ABS_URI, :message => 'is not a valid URL'
end
