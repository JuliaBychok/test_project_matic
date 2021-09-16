# frozen_string_literal: true

class ImportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @imports = Import.all
  end

  def show
    @import = Import.find(params[:id])
  end

  def new
    @import = Import.new
  end

  def create
    Imports::Create.new(current_user, import_params).call

    redirect_to imports_path, flash: {
      message: 'Created'
    }
  end

  def update
    if process_file? && import.attachment
      Imports::CreateCustomersJob.new.perform(import.id)
      current_user.admin ? (redirect_to import_path(@import)) : (redirect_to customers_path)

    elsif Imports::Update.new(import, import_params).call
      redirect_to imports_path

    else
      render :edit
    end
  end

  def edit
    @import = Import.find(params[:id])
  end

  def destroy
    Imports::Destroy.new(import).call

    redirect_to imports_path
  end

  private

  def import_params
    params.require(:imports).permit(:title, :attachment)
  end

  def import
    @import = Import.find(params[:id])
  end

  def process_file?
    params[:imports][:process]
  end
end
