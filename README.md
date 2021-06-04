# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | intger | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column      | Type         | Options                        |
| ----------- | ------------ | ------------------------------ |
| image       |              |                                |
| name        | string       | null: false                    |
| description | text         | null: false                    |
| category    | string       | null: false                    |
| condition   | string       | null: false                    |
| ship_charge | string       | null: false                    |
| ship_from   | string       | null: false                    |
| ship_days   | string       | null: false                    |
| price       | intger       | null: false                    |
| user        | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_many   :comments

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buyer    | string     | null: false                    |
| purchase | string     | null: false                    |
| item     | references | null: false  foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type    | Options            |
| ------------ | ------- | ------------------ |
| postcode     | intger  | null: false        |
| prefecture   | string  | null: false        |
| city         | string  | null: false        |
| block        | string  | null: false        |
| building     | string  |                    |
| phone_number | intger  | null: false        |

### Association

- belongs_to :order