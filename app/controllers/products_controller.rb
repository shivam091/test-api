# encoding: utf-8
# frozen_string_literal: true

class ProductsController < ApplicationController

  # GET /products
  def index
    @products = ::Product.available
    json_response(@products)
  end
end
