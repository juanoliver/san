# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    account_balance "9.99"
    phone "MyString"
  end
end
