# frozen_string_literal: true

class SessionSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :session_id
  attribute :created_at
  attribute :updated_at

  has_one :user, include_data: true
end
