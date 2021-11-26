class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :orderTime
      t.float :total
      t.string :shipAddress
      t.string :orderNum
      t.float :GST
      t.float :PST
      t.float :FST
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
