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

require 'spec_helper'

describe User do

  before {
    @user = User.new({name: 'Example User', email: 'exuser@example.com'})
  }

  it { @user.should respond_to(:name) }
  it { @user.should respond_to(:email) }
  it { @user.should be_valid }

  describe "When there is no name" do
    before { @user.name = '' }
    it { @user.should_not be_valid }
  end

  describe "When there is no email" do
    before { @user.email = '' }
    it { @user.should_not be_valid }
  end

  describe "When the email address is invalid" do
    before { @user.email = 'invalid_email_address' }
    it { @user.should_not be_valid }
  end

  describe "When the email address is not unique" do
    it "should not allow saving of non-unique emails" do
      expect {
        user2 = User.new({name: "Example User 2", email: 'exuser@example.com'})
        user2.save
      }.to raise_error
    end
  end
end
