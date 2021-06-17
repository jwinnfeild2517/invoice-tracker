require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject {
    described_class.new(
      total: 30.55,
      due: '2021-04-05',
      status: 'Paid',
      description: 'Carpet Cleaning'
    )
   }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with total missing' do
    subject.total = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with due missing' do
    subject.due = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with status missing' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with description missing' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
