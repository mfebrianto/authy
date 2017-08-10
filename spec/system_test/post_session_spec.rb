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
    let(:user) { create(:user) }

    let(:params) do
      {
        'login': {
          'username': user.username,
          'password': user.password,
          'client_id': user.client.client_id
        }
      }
    end

    before do
      post '/authy/sessions', params
    end

    context 'success' do
      subject { last_response.status }

      it { is_expected.to eq 201 }
    end

    context 'do not re-create session' do
      before do
        post '/authy/sessions', params
      end

      subject { Session.all.length }

      it { is_expected.to eq 1 }
    end

    context 're-create session on timeout' do
      before do
        sleep ENV['SESSION_TIMEOUT'].to_i.seconds
        post '/authy/sessions', params
      end

      subject { Session.all.length }

      it { is_expected.to eq 2 }
    end
  end
end
