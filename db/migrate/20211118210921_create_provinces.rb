class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.integer :tax
      t.string :name
      t.float :GST
      t.float :PST
      t.float :FST

      t.timestamps
    end
  end
end
