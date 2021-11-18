class CreateClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :classifications do |t|
      t.datetime :dateClassify
      t.references :book, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
