

FactoryBot.define do
  factory :user do
    name { "User1" }
    email { "user1@yahoo.com" }
    password { "123456" }
    #admin { false }
  end
  factory :user2, class: User do
    name { "User2" }
    email { "user2@yahoo.com" }
    password { "123456" }
    #admin { false }
  end

  factory :admin, class: User do
    name { "anselme" }
    email { "anselme@yahoo.fr" }
    password { "123456" }
    admin { true }
  end
end
