# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alarm do
    extID 1
    status "MyString"
    severity "MyString"
    date "2013-12-26 15:37:15"
    object "MyString"
    category "MyString"
    type ""
  end
end
