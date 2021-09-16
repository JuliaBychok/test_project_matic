# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Imports::Update, type: :service do
  let!(:user) do
    User.create(
      email: Faker::Internet.email,
      password: '123456',
      admin: true
    )
  end

  let(:import) do
    Import.create(
      user: user,
      title: Faker::TvShows::SiliconValley.invention,
      status: Import.statuses[:created]
    )
  end

  let!(:updated_params) do
    {
      title: Faker::TvShows::SiliconValley.invention,
      status: Import.statuses[:created]
    }
  end

  it 'update import' do
    updated_import = described_class.new(import, updated_params).call

    expect(updated_import).to be true
  end
end
