class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.decimal :total
      t.date :due
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
