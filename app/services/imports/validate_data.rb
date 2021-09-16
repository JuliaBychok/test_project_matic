# frozen_string_literal: true

module Imports
  class ValidateData
    def initialize(file_data, import)
      @file = file_data
      @import = import

      @valid_data = []
    end

    def call
      CSV.foreach(@file.file.path, headers: true).map(&:to_h).each do |row|
        @valid_data << row if valid?(row)
      end

      @import.valid_customers = valid_customers_count
      @import.invalid_customers = invalid_customers_count

      @valid_data
    end

    private

    def valid?(row)
      validate_name(row) && validate_surname(row) && validate_email(row) && validate_age(row)
    end

    def validate_name(row)
      first_name = row['first_name']
      return unless first_name

      length = first_name.length

      length >= 2
    end

    def validate_surname(row)
      last_name = row['last_name']
      return unless last_name

      length = last_name.length

      length >= 2
    end

    def validate_email(row)
      email = row['email']
      return unless email

      email.match?(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
    end

    def validate_age(row)
      date_of_birth = row['date_of_birth']

      begin
        Date.parse(date_of_birth)
      rescue ArgumentError
        return false
      end

      old_enough = (date_of_birth.to_date + 18.years) < Time.zone.today
      young_enough = (date_of_birth.to_date + 100.years) > Time.zone.today

      (old_enough && young_enough)
    end

    def total_count
      @total_count ||= CSV.foreach(@file.file.path, headers: true).count
    end

    def valid_customers_count
      @valid_data.count
    end

    def invalid_customers_count
      total_count - valid_customers_count
    end
  end
end
