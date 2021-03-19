# encoding: utf-8
# frozen_string_literal: true

class Product < ApplicationRecord

  validates :name, presence: true
  validates :material_code, presence: true, uniqueness: true
  validates :product_category_code, presence: true

  scope :available, -> { where(status: true) }
end
