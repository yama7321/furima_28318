# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday | integer | null: false |

### Association
- has_many :products
- has_many :orders
- has_one :destination

## products テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | text   | null: false |
| name     | string | null: false |
| description | text | null: false |
| category | string | null: false |
| status   | string | null: false |
| shipping_cost | string | null: false |
| prefecture_id | integer | null: false | # ActiveHashにて実装
| shipping_days | string | null: false |
| price    | integer | null: false |
| user_id  | references | null: false, foreign_key: true |
| sold_out | boolean | default: false |

### Association
- belongs_to :user
- has_one :order
- has_one :destination

## orders テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| user_id     | references | null: false, foreign_key: true |
| product_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product

## destinations テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal_code | string | null: false |
| prefecture_id | integer | null: false | # ActiveHashにて実装
| city        | string | null: false |
| house_number | string | null: false |
| building_building | string |       |
| phone_number | integer | null: false |
| user_id     | references | null: false, foreign_key: true |
| product_id  | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :product