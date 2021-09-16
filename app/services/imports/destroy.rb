# frozen_string_literal: true

module Imports
  class Destroy
    def initialize(import)
      @import = import
    end

    def call
      @import.destroy
    end
  end
end
