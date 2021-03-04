class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  validates :last_name,             presence: true
  validates :first_name,            presence: true
  validates :last_name_kana,        presence: true
  validates :first_name_kana,       presence: true
  validates :birthday,              presence: true
  validates :password,              format:   { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }
  validates :first_name,            format:   { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,             format:   { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,       format:   { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,        format:   { with: /\A[ァ-ヶー－]+\z/ }

  has_many  :product_listings
  has_many  :purchase_managements
end
