# DB 設計

## users table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| nickname               | string              | null: false             |
| email                  | string              | null: false             |
| password               | string              | null: false             |
| password confirmation  | string              | null: false             |
| last_name              | string              | null: false             |
| first_name             | string              | null: false             |
| last_name_kana         | string              | null: false             |
| first_name_kana        | string              | null: false             |
| birth_date             | date                | null: false             |



### Association

* has_many :items
* has_many :purchase

## items table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| user                   | references          | foreign_key             |
| name                   | string              | null: false             |
| description            | text                | null: false             |
| images_id              | integer             | null: false             |
| category_id            | integer             | null: false             |
| condition_id           | integer             | null: false             |
| postage_payer_id       | integer             | null: false             |
| prefecture_id          | integer             | null: false             |
| handling_time_id       | integer             | null: false             |
| price                  | integer             | null: false             |

### Association

- belongs_to :user
- has_many :images
  has_one :purchases



## purchases table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |


### Association

- has_one :addresses
- belongs_to :user
- belongs_to :items


## images table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| image       | string     | null:false        |
| item        | references | foreign_key: true |


### Association

- belongs_to :items



## addresses table

| Column                 | Type                | Options                 |
|------------------------|---------------------|-------------------------|
| post_code              | string              | null: false             |
| prefectures_id         | integer             | foreign_key: true       |
| city                   | string              | null: false             |
| building_name          | string              |                         |
| phone_number           | string              | null: false             |
| purchase               | references          | foreign_key: true       |




### Association

* belongs_to :purchases