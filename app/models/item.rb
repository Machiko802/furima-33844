class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_days_id 
    validates :price, numericality: {only_integer:true, greater_htan: 300, less_than: 10000000}
  end

  belongs_to :user
end
