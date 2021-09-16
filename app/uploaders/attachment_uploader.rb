# frozen_string_literal: true

class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    %w[csv]
  end
end
