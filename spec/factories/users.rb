FactoryBot.define do
  factory :user do

    japanese_user = Gimei.name

    nickname              { japanese_user.first.hiragana }
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    family_name           { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    family_name_kana      { japanese_user.last.katakana }
    first_name_kana       { japanese_user.first.katakana }
    birth_day             { Faker::Date.backward }
  end
end

# FactoryBot.create(:user)

# 名前漢字カナ
# https://qiita.com/taka_no_okapi/items/2cd78d3168b90e5c2534
# https://qiita.com/shun915a/items/c093559e7acdcf4cd060
# https://github.com/willnet/gimei

# 英数字混合
# https://qiita.com/takuo_maeda/items/70a3fb2cc190099f3a5e