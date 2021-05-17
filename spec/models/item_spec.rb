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
      it 'item_state_idが空だと登録できない' do
        @item.item_state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it 'shipping_fee_idが空だと登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_from_idが空だと登録できない' do
        @item.shipping_from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank")
      end
      it 'shipping_time_idが空だと登録できない' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数値でないと登録できない' do
        @item.price  = '５１４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300かそれ以上でないといけない' do
        @item.price  = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが9,999,999かそれ以下でないといけない' do
        @item.price  = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end

end
