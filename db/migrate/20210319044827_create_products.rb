# encoding: utf-8
# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :material_code, unique: true
      t.string :product_category_code
      t.boolean :status
      t.timestamps
    end
  end
end
