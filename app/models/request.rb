class Request < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start, presence: true
  validates :finish, presence: true
end
