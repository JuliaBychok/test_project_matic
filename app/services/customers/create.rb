# frozen_string_literal: true

module Customers
  class Create
    def initialize(valid_data, import)
      @valid_data = valid_data
      @import = import
    end

    def call
      Customer.insert_all(@valid_data)

      @import.completed_status!
    end
  end
end
