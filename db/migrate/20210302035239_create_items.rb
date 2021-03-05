class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, nul: false
      t.text :text, nul: false
      t.integer :category_id, nul: false
      t.integer :status_id, nul: false
      t.integer :delivery_fee_id, nul: false
      t.integer :prefecture_id, nul: false
      t.integer :delivery_day_id, nul: false
      t.integer :price, nul: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
