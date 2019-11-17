class Location < ApplicationRecord
  belongs_to :company
  has_many :invoices, as: :billable
end
