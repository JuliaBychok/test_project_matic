# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Imports::Create, type: :service do
  let!(:user) { create(:user) }
  let!(:import_created_status) { Import.statuses[:created] }

  let!(:params) do
    {
      user_id: user,
      title: Faker::TvShows::SiliconValley.invention,
      status: import_created_status
    }
  end

  let(:service_call) { described_class.new(user, params).call }

  describe '#call' do
    before do
      service_call
    end

    let(:import) { Import.first }

    let(:correct_attributes) do
      {
        id: import.id,
        created_at: import.created_at,
        updated_at: import.updated_at,
        attachment: nil,
        error_message: '',
        valid_customers: 0,
        invalid_customers: 0,
        title: params[:title],
        user_id: user.id,
        status: import_created_status,
        started_at: nil
      }
    end

    context 'when import is created' do
      it 'creates import' do
        expect(import).to be_persisted
      end

      it 'has correct attributes' do
        expect(import.attributes.symbolize_keys).to eq correct_attributes
      end
    end
  end
end
