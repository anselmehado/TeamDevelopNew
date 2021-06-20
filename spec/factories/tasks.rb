FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:content) { |n| "TEST#{n}content"}
    sequence(:deadline) { |n| "TEST_NAME#{n}"}
    sequence(:status) { |n| "TEST#{n}status"}
  end
end
