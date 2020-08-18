# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------        | -------- | --------    |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| birthday         | date     | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options           |
| --------           | --------   | ------------      |
| image_url          | string     | null: false       |
| name               | string     | null: false       |
| explanation	       | text       | null: false       |
| categorie_id       | integer    | null: false       |
| condition_id       | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| shipping_region_id | integer    | null: false       |
| delivery_days_id   | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | --------   | ------------                   |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column          | Type       | Options           |
| --------        | --------   | ------------      |
| post_code       | string     | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association

- belongs_to :purchase
