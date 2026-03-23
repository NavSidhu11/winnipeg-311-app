class CreateRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :status
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
