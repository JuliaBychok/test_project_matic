# frozen_string_literal: true

class User < ApplicationRecord
  has_many :imports, dependent: :nullify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
