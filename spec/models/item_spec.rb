require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる場合' do
      it '全項目正しく入力してあれば出品できる' do
        expect(@item).to be_valid
      end
    end


    context '商品出品ができない場合' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '説明が空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーが{---}（１）では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '状態が{---}（１）では登録できない' do
        @item.quality = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '配送料の負担が{---}（１）では登録できない' do
        @item.postage = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が{---}（１）では登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が{---}（１）では登録できない' do
        @item.shipment_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字以外では登録できない' do
        @item.price = '２２全角'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が300円より安いと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が100万円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end