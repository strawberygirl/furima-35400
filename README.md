# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               | 
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_first_name    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | reference | null: false, foreign_key: true |
| name             | string    | null: false                    |
| description      | text      | null: false                    |
| category_id      | integer   | null: false                    |
| item_state_id    | integer   | null: false                    |
| shipping_fee_id  | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| shipping_time_id | integer   | null: false                    |
| price            | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type      | Options                        |
|---------|-----------|--------------------------------|
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| order                | reference | null: false, foreign_key: true |
| postal_code          | string    | null: false                    |
| prefecture_id        | integer   | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building_name        | string    |                                |
| phone_number         | string    | null: false                    |

### Association

- belongs_to :order

