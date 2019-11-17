FactoryBot.define do
  factory :invoice do
    title { "MyString" }
    billable_id { 1 }
    billable_type { "MyString" }
    total { 1.5 }
  end
end
