FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { 1111111111 }
  end
end
