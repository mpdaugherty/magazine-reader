class Magazine < ActiveRecord::Base
  attr_accessible :name, :website

  validates_presence_of :name, :website
  validates_format_of :website, :with => URI::ABS_URI, :message => 'is not a valid URL'
end
