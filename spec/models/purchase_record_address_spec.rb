require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe 'アイテム購入情報の保存' do
    before do
      item = FactoryBot.build(:item)
      user = FactoryBot.build(:user)
      @purchase_record_address = FactoryBot.build(:purchase_record_address)
    end

    context "商品の購入ができる時" do
      it '全ての情報が正しく入力されていたら、保存ができる' do
        @purchase_record_address.valid?
      end
      it 'buildingは空でも保存ができること' do
        @purchase_record_address.building = ''
        @purchase_record_address.valid?
      end
    end

    context "商品の購入ができない時" do

      it 'post_codeが空だと保存ができないこと' do
      @purchase_record_address.post_code = ''
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが入っていないと保存ができないこと' do
        @purchase_record_address.post_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存ができないこと' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureは、「---」(idが０）では保存ができない' do
        @purchase_record_address.prefecture_id = 0
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'cityは空だと保存ができないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockは空だと保存ができないこと' do
        @purchase_record_address.block = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存ができないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが１１桁以上だと保存ができないこと' do
        @purchase_record_address.phone_number = '123456789101112'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is the wrong length (should be 11 characters)")
      end
      it 'phone_numberが英数混合では登録できないこと' do
        @purchase_record_address.phone_number = '12345qwerty'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'item_idが紐づいていないと保存ができないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが紐づいていないと保存ができないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空だと保存ができない' do
        @purchase_record_address.token = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end 
  end
end
