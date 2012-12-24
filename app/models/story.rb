class Story < ActiveRecord::Base
  belongs_to :magazine
  attr_accessible :author, :link, :published_at, :text, :title, :magazine_id
end
