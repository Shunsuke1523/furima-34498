# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :product_listings
- has_many :purchase_managements

## product_listings テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category_id            | integer    | null: false                    | 
| product_status_id      | integer    | null: false                    |
| delivery_fee_burden_id | integer    | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| delivery_days_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_one   :purchase_management
- belongs_to :user

## purchase_managements

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| shipping_addresses | references | null: false, foreign_key: true |

### Association

- belongs_to :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product_listing | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :product_listing
- has_one    :purchase_management