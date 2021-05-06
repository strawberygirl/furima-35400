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
- has_many :sold_users_items

## items テーブル

| Column           | Type      | Options                        |
|------------------|-----------|--------------------------------|
| user             | reference | null: false, foreign_key: true |
| name             | string    | null: false                    |
| description      | text      | null: false                    |
| category_id      | integer   | null: false                    |
| item_state_id    | integer   | null: false                    |
| shipping_fee_id  | integer   | null: false                    |
| shipping_from_id | integer   | null: false                    |
| shipping_time_id | integer   | null: false                    |
| price            | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :sold_users_item

## sold_users_items テーブル

| Column  | Type      | Options                        |
|---------|-----------|--------------------------------|
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase_option

## purchase_options

| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| sold_user_item       | reference | null: false, foreign_key: true |
| postal_code          | string    | null: false                    |
| prefecture_id        | integer   | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building_name        | string    |                                |
| phone_number         | string    | null: false                    |

### Association

- belongs_to :sold_users_item

