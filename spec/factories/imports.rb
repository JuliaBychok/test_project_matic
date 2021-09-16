# frozen_string_literal: true

FactoryBot.define do
  factory :import do
    title { Faker::TvShows::SiliconValley.invention }
    status { Import.statuses[:created] }
  end
end
