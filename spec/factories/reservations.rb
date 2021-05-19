FactoryBot.define do
  factory :reservation do
    user { nil }
    post { nil }
    start_date { "2021-05-15" }
    end_date { "2021-05-15" }
  end
end
