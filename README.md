# DB 設計

## users table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| nickname               | string              | null: false             |
| email                  | string              | null: false             |
| password               | string              | null: false             |
| last_name              | string              | null: false             |
| first_name             | string              | null: false             |
| last_name_kana         | string              | null: false             |
| first_name_kana        | string              | null: false             |
| birth_date             | date                | null: false             |



### Association

* has_many :items
* has_many :purchases

## items table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| user                   | references          | foreign_key: true       |
| name                   | string              | null: false             |
| description            | text                | null: false             |
| category_id            | integer             | null: false             |
| condition_id           | integer             | null: false             |
| postage_payer_id       | integer             | null: false             |
| prefecture_id          | integer             | null: false             |
| handling_time_id       | integer             | null: false             |
| price                  | integer             | null: false             |

### Association

- belongs_to :user
- has_one_attached :image
  has_one :purchase



## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |


### Association

- has_one :address
- belongs_to :user
- belongs_to :item




## addresses table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| post_code              | string              | null: false             |
| prefectures_id         | integer             | foreign_key: true       |
| city                   | string              | null: false             |
| block_number           | string              | null: false             |
| building_name          | string              |                         |
| phone_number           | string              | null: false             |
| purchase               | references          | foreign_key: true       |




### Association

* belongs_to :purchase