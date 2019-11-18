FactoryBot.define do
  factory :invoice do
    title { 'MyString' }
    billable_id { 1 }
    billable_type { 'User' }
    total { 1.5 }
    due_date { 1.day.from_now }
  end
end
