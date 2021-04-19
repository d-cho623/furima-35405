# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false |
| last-name                 | string | null: false |
| first-name                | string | null: false |
| last-name-kana            | string | null: false |
| first-name-kana           | string | null: false |
| birth-date                | date   | null: false |

### Association
- has_many: items
- has_many: buy-infos

## itemsテーブル

| Column                  | Type       | Options     |
| ----------------------  | ------     | ----------- |
| name                    | string     | null: false |
| info                    | text       | null: false |
| category_id             | integer    | null: false |
| sales_status_id         | integer    | null: false |
| shipping_fee_status_id  | integer    | null: false |
| prefecture_id           | integer    | null: false |
| scheduled_delivery_id   | integer    | null: false |
| price                   | integer    | null: false |
| user                    | references | null: false, foreign_key: true |


### Association
- belongs_to: user
- has_one: buy-info

## buy-infosテーブル
| Column                  | Type        | Options                        |
| ----------------------  | ----------  | ------------------------------ |
| user                    | references  | null: false, foreign_key: true |
| item                    | references  | null: false, foreign_key: true |


### Association

- belongs_to: user
- belongs_to: item
- has_one: shipping-address

## shipping-addressesテーブル
| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal-code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| addresses       | string     | null: false |
| building        | string     |             |
| phone-number    | string     | null: false |
| buy-info        | references | null: false, foreign_key: true |


### Association
- belongs_to: buy-info