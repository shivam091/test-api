# encoding: utf-8
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.update_or_create(attributes)
    assign_or_new(attributes).save
  end

  def self.assign_or_new(attributes)
    object = first || new
    object.assign_attributes(attributes)
    object
  end
end
