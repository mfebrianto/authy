require 'rails_helper'

describe SessionsController, type: :controller do

  describe 'create' do
    subject { JSON.parse(response.body)['data']['type'] }

    before do
      @user = create(:user)
      post :create, params
    end

    context 'success' do
      let(:params) do
        {
          params:{
            'login': {
              'username': @user.username,
              'password': @user.password,
              'client_id': @user.client.client_id
            }
          }
        }
      end

      it { is_expected.to eq 'sessions' }
    end
  end
end