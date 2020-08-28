require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image_url = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の出品' do
    context '出品できる場合' do
      it '画像と名前、説明とカテゴリーと価格があれば保存される' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'image_urlが空だと保存できない' do
        @item.image_url = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image url can't be blank")
      end
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41字以上で保存できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'explanationが空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1001字以上だと保存できない' do
        @item.explanation = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'categorie_idが空だと保存できない' do
        @item.categorie_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Categorie is not a number')
      end
      it 'condition_idが空だと保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it 'shipping_charge_idが空だと保存できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge is not a number')
      end
      it 'shipping_region_idが空だと保存できない' do
        @item.shipping_region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping region is not a number')
      end
      it 'delivery_days_idが空だと保存できない' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days is not a number')
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
