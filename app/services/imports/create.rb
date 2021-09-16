# frozen_string_literal: true

module Imports
  class Create
    def initialize(current_user, import_params)
      @current_user = current_user
      @import_params = import_params
    end

    def call
      @current_user.imports.create(@import_params)
    end
  end
end
