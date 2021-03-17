require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @product_listing = FactoryBot.build(:product_listing)
    @product_listing.image = fixture_file_upload('app/assets/images/furima-intro01.png')
    @product_listing.save
    @user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, product_listing_id: @product_listing.id)
    sleep 1
  end
  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it 'データに不備がなければ購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物番号は空でも登録できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入が上手く行かない時' do
      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @purchase_address.phone_number = 505_123_456_789
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '郵便番号の保存にはハイフンは必要であること' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '配送先の情報として、郵便番号が必須であること' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '配送先の情報として、都道府県が必須である' do
        @purchase_address.delivery_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it '配送先の情報として、市区町村が必須である' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '配送先の情報として、番地が必須である' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '配送先の情報として、電話番号が必須である' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'クレジットカード情報が必須である' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号は英数混合では登録できないこと' do
        @purchase_address.phone_number = '50_abc_345_678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空では購入できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では購入できないこと' do
        @purchase_address.product_listing_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Product listing can't be blank")
      end
    end
  end
end
