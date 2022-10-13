require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが「---」では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が「---」では出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が「---」では出品できない' do
        @item.cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it '発送元の地域が「---」では出品できない' do
        @item.sender_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end

      it '発送までの日数が「---」では出品できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it '販売価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が300円未満では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  is out of setting range')
      end
      it '販売価格が10,000,000円以上では出品できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  is out of setting range')
      end

      it '販売価格がが半角数値でなければ登録できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price  is out of setting range')
      end

      it 'ユーザーが紐付いていないと商品の出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
