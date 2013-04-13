FactoryGirl.define do

  factory :unconfirmed_user, class: User do
    sequence(:email) { |n| "user#{ n }@testing.com" }

    password              'password'
    password_confirmation 'password'

    factory :user do
      after(:create) { |user, proxy| user.confirm! }

      factory :admin do
        after(:create) { |user| user.update_attribute :admin, true }
      end
    end

  end

end
