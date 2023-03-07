# DB 設計

## users table

| Column             | Type        | Options                   |
|--------------------|-------------|---------------------------|
| nick_name          | string      | null: false               |
| email              | string      | null: false, unique: true |
| password           | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| first_name_kana    | string      | null: false               |
| last_name_kana     | string      | null: false               |
| birthday           | date        | null: false               |

### Association
* has_many :items
* has_many :orders



## items table

| Column            | Type         | Options                        |
|-------------------|--------------|--------------------------------|
| user              | references   | null: false, foreign_key: true |
| title             | string       | null: false                    |
| category_id       | integer      | null: false                    |
| quality_id        | integer      | null: false                    |
| postage_id        | integer      | null: false                    |
| prefecture_id     | integer      | null: false                    |
| shipment_date_id  | integer      | null: false                    |
| price             | integer      | null: false                    |
| detail            | text         | null: false                    |

### Association
- has_one :order
- belongs_to :user



## orders table

| Column           | Type          | Options                         |
|------------------|---------------|---------------------------------|
| user             | references    | null: false, foreign_key: true  |
| item             | references    | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses table

| Column           | Type          | Options                         |
|------------------|---------------|---------------------------------|
| order            | references    | null: false, foreign_key: true  |
| post_code        | string        | null: false                     |
| prefecture_id    | integer       | null: false                     |
| city             | string        | null: false                     |
| block            | string        | null: false                     |
| building         | string        |                                 |
| phone_number     | string        | null: false                     |

### Association

- belongs_to :order