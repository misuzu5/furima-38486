class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :sender
  belongs_to :delivery_time

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :sender_id
    validates :delivery_time_id
    validates :user_id
    validates :image
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: "can't be blank" } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :sender_id
    validates :delivery_time_id
  end
end

# Railsのバリデーションの種類と使い方
# https://qiita.com/mzmz__02/items/8f4b90e98712c76a031e

# [Ruby on Rails] 金額のバリデーション(¥300~¥9,999,999) と テストコード
# https://qiita.com/BeautifulDreamer/items/8f42cc6ff3ce0a44554d

# Rubyのバリデーション用正規表現集
# https://gist.github.com/nashirox/38323d5b51063ede1d41