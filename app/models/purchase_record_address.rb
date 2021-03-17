class PurchaseRecordAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :token
    validates :phone_number, numericality: { only_integer: true }, length: { is: 11 }
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save           
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    CustomerAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
