# frozen_string_literal: true

class Import < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :user
  has_many :customers, dependent: :nullify

  enum status: {
    created: 'created',
    started: 'started',
    failed: 'failed',
    completed: 'completed'
  }, _suffix: true
end
