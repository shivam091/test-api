# encoding: utf-8
# frozen_string_literal: true

# rake add_products RAILS_ENV=XXX

desc "Adds products"
task add_products: :environment do
  require "csv"

  CSV.foreach("#{Rails.root}/db/data/product_details.csv", headers: true) do |row|
    ::Product.find_and_update_or_create(name: row["name"]) do
      {
        material_code: row["material_code"],
        product_category_code: row["product_category_code"],
        status: row["status"]
      }
    end
  end
end
