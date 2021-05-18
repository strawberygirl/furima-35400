require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user[:id])
  end

  describe '商品出品' do
    context '商品出品ができる時' do
      it '商品情報が正しい値で全て入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_state_idが空だと登録できない' do
        @item.item_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it 'item_state_idが1だと登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item state must be other than 1')
      end
      it 'shipping_fee_idが空だと登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
      end
      it 'shipping_from_idが空だと登録できない' do
        @item.shipping_from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank")
      end
      it 'shipping_from_idが1だと登録できない' do
        @item.shipping_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping from must be other than 1')
      end
      it 'shipping_time_idが空だと登録できない' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
      it 'shipping_time_idが1だと登録できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping time must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角文字の数値では登録できない' do
        @item.price = '５１４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'test123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英字のみでは登録できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300かそれ以上でないといけない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが9,999,999かそれ以下でないといけない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end
  end
end
