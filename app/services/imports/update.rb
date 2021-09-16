# frozen_string_literal: true

module Imports
  class Update
    def initialize(import, import_params)
      @import = import
      @import_params = import_params
    end

    def call
      @import.update(@import_params)
    end
  end
end
