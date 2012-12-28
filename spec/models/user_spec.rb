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

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "When the email address is not unique" do
    it "should not allow saving of non-unique emails" do
      example_email = 'abc@example.com'
      User.create({name: "Example User 2", email: example_email})
      user2 = User.new({name: "Example User 3", email: example_email})
      user2.should_not be_valid
      user2.save().should be_false
    end

    it "should not allow saving of duplicate emails regardless of case" do
      @user.save()
      user2 = @user.dup
      user2.email = user2.email.upcase
      user2.should_not be_valid
    end
  end
end
