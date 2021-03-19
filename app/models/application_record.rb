# encoding: utf-8
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_and_update_or_create(attributes, &block)
    assign_or_new(attributes, &block).save
  end

  def self.assign_or_new(attributes, &block)
    object = where(attributes).first || new
    object.assign_attributes(yield)
    object
  end
end
