class Book < ApplicationRecord
  has_many :book_categorys
  has_many :categorys, through: :book_categorys

  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
end
