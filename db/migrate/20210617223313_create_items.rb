class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :qty
      t.decimal :cost
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
