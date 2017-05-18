class User < ApplicationRecord

  has_many :sessions

  attr_accessor :password_confirmation

  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
