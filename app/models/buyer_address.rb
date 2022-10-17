class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid"}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    buyers = Buyers.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end