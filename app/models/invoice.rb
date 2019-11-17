class Invoice < ApplicationRecord
  belongs_to :billable, polymorphic: true
end
