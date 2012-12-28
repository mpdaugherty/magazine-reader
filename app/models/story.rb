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

class Story < ActiveRecord::Base
  belongs_to :magazine
  attr_accessible :author, :link, :published_at, :text, :title, :magazine_id

  # This line ensures that no one can create a new story without at least a link, a title, and the body text
  validates_presence_of :title, :link, :text

  # This line makes sure that links are valid URLs.  A URL is a special type of URI (Uniform Resource Identifier),
  # and there is a Rails modules called URI as well.  We use its 'ABS_URI' method to match :link.  Absolute URIs have
  # to include the transfer protocol (e.g. http:// or https://), the server address (e.g. www.mpdaugherty.com),
  # and the file path (/something/something)
  validates_format_of :link, :with => URI::ABS_URI, :message => 'is not a valid URL'
end
