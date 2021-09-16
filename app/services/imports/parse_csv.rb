# frozen_string_literal: true

module Imports
  class ParseCsv
    def initialize(import)
      @import = import
      @attachment = import.attachment
    end

    def call
      Customers::Create.new(valid_data, @import).call
    end

    private

    def valid_data
      @valid_data ||= Imports::ValidateData.new(@attachment, @import).call
    end
  end
end
