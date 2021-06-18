class Item < ApplicationRecord
  belongs_to :invoice

  validates :name, presence: true
  validates :qty, presence: true
  validates :cost, presence: true
  validates :invoice_id, presence: true

end
