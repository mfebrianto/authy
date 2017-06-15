class User < ApplicationRecord

  has_many :sessions
  belongs_to :client

  attr_accessor :password_confirmation, :state

  validates :username, presence: true, if: :all_process?
  validates :password, presence: true, if: :all_process?
  validates :password_confirmation, presence: true, if: :update_process?
  validate :validate_credentials, if: :check_process?
  validates :state, presence: true

  def validate_credentials
    valid_username? && valid_password? && valid_client?
  end

  def valid_username?

  end

  def valid_password?

  end

  def valid_client?

  end

  def all_process?
    ['create', 'update', 'check'].include?(state)
  end

  def check_process?
    ['check'].include?(state)
  end

  def update_process?
    ['create', 'update'].include?(state)
  end

end
