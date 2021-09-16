# frozen_string_literal: true

# frozen_string_literan: true

module Imports
  class CreateCustomersJob < ApplicationJob
    queue_as :default

    def perform(import_id)
      import = Import.find import_id
      import.update(
        status: Import.statuses[:started], started_at: Time.zone.now
      )

      Imports::ParseCsv.new(import).call
    rescue StandardError => e
      import.update!(
        error_message: e.message, status: Import.statuses[:failed]
      )
    end
  end
end
