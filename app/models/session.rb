class Session < ApplicationRecord

  before_save :create_session_id

  belongs_to :user

  def create_session_id
    self.session_id = SecureRandom.uuid
  end

end
