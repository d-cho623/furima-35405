# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------      | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth_date           | date   | null: false |

### Association
- has_many: items
- has_many: orders
- has_many: comments

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
- has_one: order
- has_many: comments
- has_many: tags
- has_many: item_tags


## ordersテーブル
| Column                  | Type        | Options                        |
| ----------------------  | ----------  | ------------------------------ |
| user                    | references  | null: false, foreign_key: true |
| item                    | references  | null: false, foreign_key: true |


### Association

- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル
| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal_code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building        | string     |             |
| phone_number    | string     | null: false |
| order           | references | null: false, foreign_key: true |


### Association
- belongs_to: order


## commentテーブル
| Column   | Type           | Options                        |
| ---------| -------------- | -----------------------------  |
| text     | text           | null: false                    |
| user     | references     | null: false, foreign_key: true |
| item     | references     | null: false, foreign_key: true |


### Association
- belongs_to: user
- belongs_to: item


## tagテーブル
| Column   | Type           | Options                        |
| ---------| -------------- | -----------------------------  |
| title    | string         | null: false                    |

### Association
- has_many: items
- has_many: item_tag_relations


## item_tag_relationテーブル
| Column   | Type           | Options                        |
| ---------| -------------- | -----------------------------  |
| item     | references     | null: false, foreign_key: true |
| tag      | references     | null: false, foreign_key: true |


### Association
- belongs_to: item
- belongs_to: tag