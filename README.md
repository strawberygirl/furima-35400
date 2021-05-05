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
- has_many :purchase_options

## items テーブル

| Column        | Type      | Options                        |
|---------------|-----------|--------------------------------|
| user_id       | reference | null: false, foreign_key: true |
| name          | string    | null: false                    |
| description   | text      | null: false                    |
| category      | integer   | null: false                    |
| item_state    | integer   | null: false                    |
| shipping_fee  | integer   | null: false                    |
| shipping_from | integer   | null: false                    |
| shipping_time | integer   | null: false                    |
| price         | string    | null: false                    |

### Association

-belongs_to :user
-has_many :sold_users_items

## sold_users_items テーブル

| Column  | Type      | Options                        |
|---------|-----------|--------------------------------|
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item

## purchase_options

| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| user_id              | reference | null: false, foreign_key: true |
| postal_code          | string    | null: false                    |
| prefecture           | integer   | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building_name        | string    |                                |
| phone_number         | string    | null: false                    |

### Association

- belong_to :user


