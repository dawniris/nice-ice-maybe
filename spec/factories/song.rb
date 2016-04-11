FactoryGirl.define do
  factory :song do
    sequence(:payload) { |n|
      <<-SONG
      song song #{n} song
      words words #{n} words
      SONG
    }
  end
end
