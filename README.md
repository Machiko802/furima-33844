# テーブル設計

## usersテーブル

｜ Column          |   Type   | Options    |
｜ --------------- | -------- | ---------- |
｜ nickname        |  string  | nul: false |
｜ first_name      |  string  | nul: false |
｜ last_name       |  string  | nul: false |
｜ first_name_kana |  string  | nul: false 
｜ last_name_kana  |  string  | nul: false |
｜ email           |  string  | nul: false |
｜ password        |  string  | nul: false |
｜ phone_number    |  string  | nul: false |
｜ birthday        |  string  | nul: false |

## Association

has_many :items
has_many :purchase_records
has_one :customer_address

## itemsテーブル

｜ Column        |   Type        | Options                       |
｜ ------------- | ------------- | ----------------------------- |
｜ name          | string        | nul: false                    |
｜ image         | ActiveStorage | nul: false                    |
｜ text          | text          | nul: false                    |
｜ category      | string        | nul: false                    |
｜ status        | string        | nul: false                    |
｜ delivery_fee  | integer       | nul: false                    |
｜ shipping_area | string        | nul: false                    |
｜ delivery_days | string        | nul: false                    |
｜ price         | integer       | nul: false                    |
｜ user          | references    | nul: false, foreign_key: true |

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
｜ post_code       | integer    | nul: false                    |
｜ prefecture      | string     | nul: false                    |
｜ city            | string     | nul: false                    |
｜ block           | string     | nul: false                    |
｜ building        | string     | nul: false                    |
｜ phone_number    | string     | nul: false                    |
｜ purchase_record | references | nul: false, foreign_key: true |

## Association

belongs_to :purchase_record