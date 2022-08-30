FactoryBot.define do
  factory :task do
    content { Faker::Lorem.word }
    done { false }
  end 
end
