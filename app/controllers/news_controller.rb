# encoding: utf-8
# frozen_string_literal: true

class NewsController < ApplicationController

  def index
    result = NewsService.call(api_key: ENV.fetch("api_key"))
    if result.success?
      @news = ::News.all
      json_response(@news)
    else
      json_response(result.message + ": " + result.payload[:exception])
    end
  end
end
