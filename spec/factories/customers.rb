# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.between(from: 70.years.ago, to: 19.years.ago) }

    trait :another_name do
      first_name { Faker::Name.first_name }
    end
  end
end
