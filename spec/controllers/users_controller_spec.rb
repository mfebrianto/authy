require 'rails_helper'

describe UsersController do
  let(:headers) do
    {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }
  end

  describe 'create' do
    subject { response.body }

    let(:params) do
      {
        params:{
          'user': {
            'username': 'test@mailinator.com',
            'password': 'password',
            'password_confirmation': 'password',
            'client_id': '123'
          }
        }
      }
    end
    let(:user_interactor_dummy) { instance_double(UserInteractor) }
    let(:result) do
      { 'success': true }
    end

    before do
      allow(UserInteractor).to receive(:new) { user_interactor_dummy }
      allow(user_interactor_dummy).to receive(:create).and_return(result)
      post :create, params
    end

    context 'has json response' do
      it { is_expected.to eq result.to_json }
    end
  end
end