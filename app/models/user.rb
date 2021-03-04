class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many  :product_listings
  has_many  :purchase_managements
end
