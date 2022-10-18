FactoryBot.define do
  factory :buyer_address do
    
    user_id        {Faker::Number.non_zero_digit}
    item_id        {Faker::Number.non_zero_digit}
    post_code      {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
    prefecture_id  {Faker::Number.between(from: 1, to: 47)}
    city           {Faker::Address.city}
    address        {Faker::Address.street_address}
    building_name  {Faker::App.name}
    phone_number   {Faker::Number.leading_zero_number(digits: 11)}
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
