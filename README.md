# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :product_listings
- has_many :product_purchases
- 
## product_listings テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | string     | null: false                    | 
| product_status      | string     | null: false                    |
| delivery_fee_burden | string     | null: false                    |
| delivery_area       | string     | null: false                    |
| delivery_days       | date       | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| product_purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_purchase

## product_purchases

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| payment_amount      | integer    | null: false                    |
| card_information    | date       | null: false                    | 
| expiration_date     | integer    | null: false                    |
| security_code       | integer    | null: false                    |
| postal_code         | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| product_listing     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product_listing
