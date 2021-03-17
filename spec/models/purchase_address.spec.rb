require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  describe '商品購入機能' do
    context '商品購入が上手くいく時' do
      it 'データに不備がなければ購入できる' do
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
    end
  end
end
