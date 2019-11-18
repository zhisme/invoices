class User < ApplicationRecord
  has_many :companies
  has_many :invoices, as: :billable

  validates :login, uniqueness: true
end
