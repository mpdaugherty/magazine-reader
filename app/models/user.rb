# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates_presence_of :email, :name
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /^.+@.+\..+$/, :message => 'is not a valid email address'
  before_save { |user| user.email = email.downcase }
end
