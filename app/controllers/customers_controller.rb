# frozen_string_literal: true

class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end
end
