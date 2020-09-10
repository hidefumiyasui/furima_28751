require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
    end

    context '購入機能がうまくいかないとき' do
      it 'tokenが空だと保存できない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できない' do
        @item_order.post_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeはハイフンがないと保存できない' do
        @item_order.post_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが空だと保存できない' do
        @item_order.prefecture_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefecture_idが１だと保存できない' do
        @item_order.prefecture_id = '1'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @item_order.house_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @item_order.phone_number = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以下でないと保存できない' do
        @item_order.phone_number = '123123412345'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberはハイフンが入ってると保存できない' do
        @item_order.phone_number = '123-1234-1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
