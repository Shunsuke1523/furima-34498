require 'rails_helper'

RSpec.describe ProductListing, type: :model do
  before do
    @product_listing = FactoryBot.build(:product_listing)
    @product_listing.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end
  describe 'ユーザー新規登録' do
    it '商品画像を1枚つけることが必須である' do
      @product_listing.image = nil
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須である' do
      @product_listing.product_name = ''
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が必須である' do
      @product_listing.product_description = ''
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include("Product description can't be blank")
    end
    it 'カテゴリーの情報が必須である' do
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須である' do
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Product status must be other than 1')
    end
    it '配送料の負担についての情報が必須である' do
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Delivery fee burden must be other than 1')
    end
    it '発送元の地域についての情報が必須である' do
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Delivery area must be other than 1')
    end
    it '発送までの日数についての情報が必須である' do
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Delivery days must be other than 1')
    end
    it '販売価格についての情報が必須である' do
      @product_listing.price = nil
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は、¥300~9,999,999の間のみ保存可能である' do
      @product_listing.price = '10000000'
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Price must be less than 10000000')
    end
    it '販売価格は、¥300~9,999,999の間のみ保存可能である' do
      @product_listing.price = '299'
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '販売価格は半角数字のみ保存可能である' do
      @product_listing.price = 'aaaa'
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格は半角数字のみ保存可能である' do
      @product_listing.price = '１００００'
      @product_listing.valid?
      expect(@product_listing.errors.full_messages).to include('Price is not a number')
    end
  end
end
