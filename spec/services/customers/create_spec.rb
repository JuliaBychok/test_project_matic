# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::Create, type: :service do
  let!(:user) { create(:user) }
  let!(:import) { create(:import, user: user) }

  let!(:valid_data) do
    [
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      date_of_birth: Faker::Date.between(from: 70.years.ago, to: 19.years.ago)
    ]
  end

  let(:expected_atrributes) do
    {
      id: Customer.first.id,
      first_name: valid_data.first[:first_name],
      last_name: valid_data.first[:last_name],
      email: valid_data.first[:email],
      date_of_birth: valid_data.first[:date_of_birth],
      import_id: nil
    }
  end

  let(:customer) { Customer.first }
  let(:service_call) { described_class.new(valid_data, import).call }

  describe '#call' do
    let(:customers_count) { Customer.count }
    let(:expected_customers_count) { 1 }

    before do
      service_call
    end

    context 'when service is called' do
      it 'creates customer' do
        expect(customers_count).to eq expected_customers_count
      end

      it 'creates valid customer' do
        expect(customer.attributes.symbolize_keys).to eq expected_atrributes
      end
    end
  end
end
