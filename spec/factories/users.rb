FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = '123abc'
    password { password }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '健太' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'ケンタ' }
    birth_date { '1934-05-01' }
  end
end
