FactoryGirl.define do
  factory :poem do
    sequence(:name) { |n| "#{n}" }
    sequence(:data) { |n| "poem words #{n} poem" }
  end
end