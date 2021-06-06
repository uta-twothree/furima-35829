require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する商品の登録' do
    context '商品を出品できるとき' do
      it 'nameとdescription、image、categoryとcondition、ship_chargeとship_fromとship_days、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'categoryのidが1の時は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category cannnot be blank')
      end

      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'conditionのidが1の時は登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition cannnot be blank')
      end

      it 'ship_chargeが空では登録できない' do
        @item.ship_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship charge can't be blank")
      end

      it 'ship_charge_idのidが1の時は登録できない' do
        @item.ship_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship charge cannnot be blank')
      end

      it 'ship_fromが空では登録できない' do
        @item.ship_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from can't be blank")
      end

      it 'ship_from_idのidが1の時は登録できない' do
        @item.ship_from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from cannnot be blank')
      end

      it 'ship_daysが空では登録できない' do
        @item.ship_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship days can't be blank")
      end

      it 'ship_days_idのidが1の時は登録できない' do
        @item.ship_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship days cannnot be blank')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceは全角数字では登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end

      it 'priceは299円以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceは10000000円以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
