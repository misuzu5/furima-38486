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
    validates :image
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: ' is out of setting range' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :sender_id
    validates :delivery_time_id
  end
end

