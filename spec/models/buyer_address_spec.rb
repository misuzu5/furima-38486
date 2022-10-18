require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '配送先住所の保存' do
    context '配送先住所が登録できる場合' do

      it '全ての項目が存在すれば登録できる' do
        expect(@buyer_address).to be_valid
      end

      it '建物名が空でも登録できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '配送先住所が登録できない場合' do
      it '郵便番号が空では投稿できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end  
      
      it '郵便番号は「3桁ハイフン4桁」でしか登録できない' do
        @buyer_address.post_code = '1111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end 

      it '郵便番号は半角文字列でしか登録できない' do
        @buyer_address.post_code = 'あああああああ'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end 

      it '都道府県が空では投稿できない' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end  

      it '市区町村が空では投稿できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end   

      it '番地が空では投稿できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end   

      it '電話番号が空では投稿できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it '電話番号は10桁以上11桁以内でしか登録できない' do
        @buyer_address.phone_number = '111-2222-3333'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it '電話番号は半角数値でしか登録できない' do
        @buyer_address.phone_number = 'ああああいいいいうううう'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   
    end
  end
end


# bundle exec rspec spec/models/buyer_address_spec.rb