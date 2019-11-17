class User < ApplicationRecord
  has_many :companies
  has_many :invoices, as: :billable

  def preferences
    settings[:billing_process] || :per_company
  end
end
