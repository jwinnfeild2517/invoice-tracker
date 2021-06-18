require 'rails_helper'

RSpec.describe Item, type: :model do
  subject {
    described_class.new(
      name: 'Tires',
      qty: '4',
      cost: 600,
      invoice_id: 1
    )
  }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

end
