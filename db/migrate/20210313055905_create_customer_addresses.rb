class CreateCustomerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_addresses do |t|
      t.string     :post_code,       nul: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :block,           null: false
      t.string     :building
      t.string     :phone_number,    null: false
      t.references :purchase_record, nul: false, foreign_key: true
      t.timestamps
    end
  end
end
