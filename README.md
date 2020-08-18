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
| birthday_year    | integer  | null: false |
| birthday_month   | integer  | null: false |
| birthday_day     | integer  | null: false |

### Association

- has_many :items
- has_many :delivery


## items テーブル

| Column          | Type       | Options           |
| --------        | --------   | ------------      |
| image_url       | string     | null: false       |
| name            | string     | null: false       |
| explanation	    | text       | null: false       |
| categorie       | string     | null: false       |
| condition       | string     | null: false       |
| shipping_charge | integer    | null: false       |
| shipping_region | string     | null: false       |
| delivery_days   | integer    | null: false       |
| price           | integer    | null: false       |
| useer_id        | references | foreign_key: true |


### Association

- has_one :delivery
- belongs_to :user

## delivery テーブル

| Column          | Type       | Options           |
| --------        | --------   | ------------      |
| post_code       | integer    | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     | null: false       |
| phone_number    | integer    | null: false       |
| user_id         | references | foreign_key: true |
| items_id        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
