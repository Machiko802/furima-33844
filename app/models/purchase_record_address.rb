class PurchaseRecordAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
  end
  validates :phone_number, numericality: {with: /\A[0-9]{11}\z/, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save           
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    CustomerAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
