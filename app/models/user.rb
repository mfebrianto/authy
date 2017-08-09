# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sessions
  belongs_to :client

  attr_accessor :password_confirmation

  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
