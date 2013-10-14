FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }

    password 'foobar'
    role Role.user

    factory :admin_user do
      role Role.admin
    end
  end
end
