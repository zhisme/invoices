class Company < ApplicationRecord
  belongs_to :user
  has_many :invoices, as: :billable
end
