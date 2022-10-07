## users

|Column                  |Type     |Options                    |
|------------------------|---------|---------------------------|
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false               |
| family_name            | string  | null: false               |
| first_name             | string  | null: false               |
| family_name_kana       | string  | null: false               |
| first_name_kana        | string  | null: false               |
| birth_day              | integer | null: false               |

### Association
- has_many :items
- has_many :buyers



## items

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false, unique: true      |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| cost               | string     | null: false                    |
| sender             | string     | null: false                    |
| days               | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :buyer



## buyers

|Column                   |Type        |Options                         |
|-------------------------|------------|--------------------------------|
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |
| address                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address



## addresses

|Column             |Type        |Options                         |
|-------------------|------------|--------------------------------|
| post_code         | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | integer    | null: false                    |
| buyer             | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer
