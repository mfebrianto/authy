# frozen_string_literal: true

require 'rails_helper'
require_relative './system_test_helper'

describe 'post user', system_test: true do
  let(:headers) do
    {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }
  end

  describe 'create' do
    subject { last_response.status }

    let(:params) do
      {
        'user': {
          'username': 'test@mailinator.com',
          'password': 'password',
          'password_confirmation': 'password',
          'client_id': 'c249bd59-fc27-42b7-a832-d0160447da45'
        }
      }
    end

    before do
      post '/authy/users', params
    end

    context 'has json response' do
      it { is_expected.to eq 201 }
    end
  end
end
