class Invoice < ApplicationRecord
  enum status: {not_paid: 0, paid: 1}

  belongs_to :billable, polymorphic: true
end
