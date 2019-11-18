FactoryBot.define do
  factory :company do
    sequence(:title) { |n| "My Company #{n}" }
    settings { {} }
    user

    trait :standalone do
      settings { {billing_process: :per_company} }
    end
  end
end
