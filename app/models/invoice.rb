class Invoice < ApplicationRecord
  has_many :items

  validates :total, presence: true
  validates :due, presence: true
  validates :status, presence: true
  validates :description, presence: true
  validates :invoice_number, uniqueness: true

  before_save :set_invoice_number

  private
  def set_invoice_number
    self.invoice_number = SecureRandom.alphanumeric(5)
  end
end
