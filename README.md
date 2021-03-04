# テーブル設計

## usersテーブル

｜ Column             |   Type   | Options                  |
｜ ------------------ | -------- | ------------------------ |
｜ nickname           |  string  | nul: false               |
｜ first_name         |  string  | nul: false               |
｜ last_name          |  string  | nul: false               |
｜ first_name_kana    |  string  | nul: false               |
｜ last_name_kana     |  string  | nul: false               |
｜ email              |  string  | nul: false, unique: true |
｜ encrypted_password |  string  | nul: false               |
｜ birthday           |  date    | nul: false               |

## Association

has_many :items
has_many :purchase_records

## itemsテーブル

｜ Column           |   Type        | Options                       |
｜ ---------------- | ------------- | ----------------------------- |
｜ name             | string        | nul: false                    |
｜ text             | text          | nul: false                    |
｜ category_id      | integer       | nul: false                    |
｜ status_id        | integer       | nul: false                   |
｜ delivery_fee_id  | integer       | nul: false                    |
｜ prefecture_id    | integer       | nul: false                   |
｜ delivery_day_id | integer        | nul: false                   |
｜ price            | integer       | nul: false                    |
｜ user             | references    | nul: false, foreign_key: true |

## Association

belongs_to :user
has_one :purchase_record

## purchase_recordsテーブル

｜ Column         | Type       | Options                       |
｜ -------------- | ---------- | ----------------------------- |
｜ user           | references | nul: false, foreign_key: true |
｜ item           | references | nul: false, foreign_key: true |


## Association
belongs_to :user
belongs_to :item
has_one :customer_address

## customer_addresses

｜ Column          | Type       | Options                       |
｜ --------------- | ---------- | ----------------------------- |
｜ post_code       | string     | nul: false                    |
｜ prefecture_id   | integer    | nul: false                    |
｜ city            | string     | nul: false                    |
｜ block           | string     | nul: false                    |
｜ building        | string     |                               |
｜ phone_number    | string     | nul: false                    |
｜ purchase_record | references | nul: false, foreign_key: true |

## Association

belongs_to :purchase_record