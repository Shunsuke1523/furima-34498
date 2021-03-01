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
- has_many :product_purchases
- has_many :shipping_addresses

## product_listings テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category_id            | string     | null: false                    | 
| product_status_id      | string     | null: false                    |
| delivery_fee_burden_id | string     | null: false                    |
| delivery_area_id       | string     | null: false                    |
| delivery_days_id       | date       | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_many   :shipping_addresses
- has_many   :product_purchases
- belongs_to :user

## purchase_managements

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures_id     | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| product_listing    | references | null: false, foreign_key: true |
| product_name       | references | null: false, foreign_key: true |
| price              | references | null: false, foreign_key: true |
| shipping_addresses | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_listing
- belongs_to :shipping_addresses

## shipping_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| delivery_fee_burden_id | references | null: false, foreign_key: true |
| delivery_area_id       | references | null: false, foreign_key: true |
| delivery_days_id       | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |
| product_listing        | references | null: false, foreign_key: true |
| purchase_managements   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :product_listing
- belongs_to :purchase_managements