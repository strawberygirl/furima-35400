require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user_2 = FactoryBot.create(:user, email: '2@gmail.com')
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, user_id: user_2[:id], item_id: item[:id])
    sleep 0.2
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it '購入情報が正しい値で全て入力されている時' do
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空の時' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空の時' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていない時' do
        @order.postal_code = '3334444'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが半角英字の時' do
        @order.postal_code = 'aaa-bbbb'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが半角英数字混合の時' do
        @order.postal_code = '111-aaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空の時' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1の時' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空の時' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の時' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空の時' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以下の時' do
        @order.phone_number = '123'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以上の時' do
        @order.phone_number = '11223344556677'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角英字の時' do
        @order.phone_number = 'aaabbbbcccc'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角英数字混合の時' do
        @order.phone_number = '0901234567a'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
