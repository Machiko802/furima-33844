class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.references :user, nul: false, foreign_key: true
      t.references :item, nul: false, foregin_key: true
      t.timestamps
    end
  end
end
