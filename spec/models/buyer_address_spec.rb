require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先住所の保存' do
    context '配送先住所が保存できる場合' do

      it '全ての項目(token含む)が存在すれば保存できる' do
        expect(@buyer_address).to be_valid
      end

      it '建物名は空でも保存できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '配送先住所が保存できない場合' do
      it '郵便番号が空では保存できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end  
      
      it '郵便番号は「3桁ハイフン4桁」でしか保存できない' do
        @buyer_address.post_code = '1111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end 

      it '郵便番号は半角文字列でしか保存できない' do
        @buyer_address.post_code = 'あああああああ'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end 

      it '都道府県が「---」では保存できない' do
        @buyer_address.prefecture_id = '0'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end  

      it '市区町村が空では保存できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end   

      it '番地が空では保存できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end   

      it '電話番号が空では保存できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it '電話番号は9桁以下では保存できない' do
        @buyer_address.phone_number = '111222333'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it '電話番号は12桁以上では保存できない' do
        @buyer_address.phone_number = '111222333444'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it '電話番号は半角数値でしか保存できない' do
        @buyer_address.phone_number = 'あいうえお'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end   

      it "tokenが空では登録できないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end  

      it 'userが紐付いていないと保存できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end


# bundle exec rspec spec/models/buyer_address_spec.rb