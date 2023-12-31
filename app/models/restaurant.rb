# frozen_string_literal: true

# rubocop --autocorrect --disable
class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category,
            inclusion: { in: %w[chinese italian japanese french belgian], message: '%<value>s is not a valid size' }
end
