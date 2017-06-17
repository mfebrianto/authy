# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attribute :id
  attribute :username

end
