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
- has_many :purchase_options

## items テーブル

| Column        | Type    | Options     |
|---------------| --------| null: false |
| image         | string  | null: false |
| name          | string  | null: false |
| description   | text    | null: false |
| category      | string  | null: false |
| item_state    | text    | null: false |
| shipping_fee  | string  | null: false |
| shipping_from | string  | null: false |
| shipping_time | string  | null: false |
| price         | string  | null: false |

### Association

- belongs_to :user
- has_one :purchase_option

## purchase_options

| Column               | Type   | Options     |
| ---------------------| -------| ------------|
| card_number          | string | null: false |
| card_expiration_date | date   | null: false |
| card_security_code   | string | null: false |
| postal_code          | string | null: false |
| prefecture           | string | null: false |
| city                 | string | null: false |
| address              | string | null: false |
| building_name        | string | null: true  |
| phone_number         | string | null: false |

### Association

- has_one :item
- belong_to :user


