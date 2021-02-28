FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { 'はなこ' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'ハナコ' }
    birthday              { '2020-01-01' }
  end
end
