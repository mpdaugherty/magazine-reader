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
    @user = User.new({name: 'Example User', email: 'exuser@example.com',
                      password: "foobar", password_confirmation: "foobar"})
  }

  it { @user.should respond_to(:name) }
  it { @user.should respond_to(:email) }
  it { @user.should be_valid }
  it { @user.should respond_to(:password_digest) }
  it { @user.should respond_to(:password) }
  it { @user.should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

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

  it "should convert email addresses to lowercase when saving" do
    @user.email = 'UPPERCASE@EXAMPLE.CO'
    @user.save
    @user.email.should eq 'uppercase@example.co'
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { @user.should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { @user.should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end
