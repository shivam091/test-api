# encoding: utf-8
# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      json_response({ message: exception.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      json_response({ message: exception.message }, :unprocessable_entity)
    end
  end
end
