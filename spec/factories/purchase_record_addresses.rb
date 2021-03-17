FactoryBot.define do
  factory :purchase_record_address do
    user_id        { Faker::Number.number(digits: 2) }
    item_id        { Faker::Number.number(digits: 2) }
    post_code      { "123-0012" }
    prefecture_id  { Faker::Number.within(range: 2..48) }
    city           { "豊島区" }
    block          { "青山1-1-1" }
    building       { "銀座ビル５１０" }
    phone_number   { "11111111111" }
    token          { "rthiknkkbl788" }
  end
end