# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    username 'test@mailinator.com'
    password 'password'
    password_confirmation 'password'
    association :client
  end
end
