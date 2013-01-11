FactoryGirl.define do
  factory :user do
    name     "Michael Daugherty"
    email    "mike@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end