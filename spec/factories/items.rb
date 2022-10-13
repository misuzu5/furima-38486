FactoryBot.define do
  factory :item do
    association :user

    item_name        { Faker::Name.name }
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    cost_id          { Faker::Number.between(from: 2, to: 3) }
    sender_id        { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

# モデル単体テスト内で、Fakerを使ってランダムな値を生成できるように上書きをする方法
# https://qiita.com/TerToEer_sho/items/84ea7299c423fccb067e

# Ruby on Railsの画像の保存場所(assets?public?)
# https://qiita.com/mzmz__02/items/ce3382d62d32aec2348e

# 【Ruby on Rails】to be valid, but got errors: User can’t be blank 【RSpec】が解決できなかった件
# https://insyokuprogram.com/2021/08/08/%E3%80%90ruby-on-rails%E3%80%91to-be-valid-but-got-errors-user-cant-be-blank-%E3%80%90rspec%E3%80%91%E3%81%8C%E8%A7%A3%E6%B1%BA%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E4%BB%B6/
