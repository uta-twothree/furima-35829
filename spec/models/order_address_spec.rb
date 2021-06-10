require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'ship_fromを選択していないと保存できないこと' do
        @order_address.ship_from_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Ship from can't be blank")
      end

      it 'ship_from_idのidが1の時は登録できない' do
        @order_address.ship_from_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Ship from can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できないこと' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは10桁以上11桁以下の場合でしか登録できない' do
        @order_address.phone_number = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is out of setting range')
      end

      it 'phone_numberが12桁以上の場合は登録できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is out of setting range')
      end

      it 'phone_numberは英数字混合では登録できない' do
        @order_address.phone_number = 'abc123de456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberは全角数字では登録できない' do
        @order_address.phone_number = '１１１１２２２２３３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
