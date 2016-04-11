FactoryGirl.define do
  factory :song_slice do
    sequence(:chunk) { |n| "chunk chunky #{n} chunk"}
    song
  end
end