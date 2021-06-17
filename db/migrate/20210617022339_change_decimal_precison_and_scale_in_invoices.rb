class ChangeDecimalPrecisonAndScaleInInvoices < ActiveRecord::Migration[6.1]
  def change

    change_column :invoices, :total, :decimal, :precision => 9, :scale => 2
  end
end
