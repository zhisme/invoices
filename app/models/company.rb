class Company < ApplicationRecord
  belongs_to :user
  has_many :invoices, as: :billable
  has_many :locations

  validates :title, presence: true
  validates :title, uniqueness: true

  def standalone?
    settings['billing_process'] == 'per_company'
  end
end
