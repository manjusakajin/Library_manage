class Category < ApplicationRecord
  has_many :book_categorys
  has_many :books, through: :book_categorys
end
