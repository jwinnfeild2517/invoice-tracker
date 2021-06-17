json.extract! invoice, :id, :total, :due, :status, :description, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
