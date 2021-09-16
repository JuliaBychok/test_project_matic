# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Imports::Destroy, type: :service do
  let!(:user) do
    User.create(
      email: Faker::Internet.email,
      password: '123456',
      admin: true
    )
  end

  let!(:import) do
    Import.create(
      user: user,
      title: Faker::TvShows::SiliconValley.invention,
      status: Import.statuses[:created]
    )
  end

  it 'deletes import' do
    destroyed_import = described_class.new(import).call

    expect(destroyed_import).not_to be_persisted
  end
end
