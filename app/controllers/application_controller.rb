# encoding: utf-8
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
end
