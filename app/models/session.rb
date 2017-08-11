# frozen_string_literal: true

class Session < ApplicationRecord
  before_save :create_session_id

  SESSION_TIMEOUT = ENV['SESSION_TIMEOUT'].to_i.freeze

  belongs_to :user

  delegate :username, to: :user

  def create_session_id
    self.session_id = SecureRandom.uuid
  end

  def expired?
    Time.now.utc - updated_at > SESSION_TIMEOUT
  end
end
