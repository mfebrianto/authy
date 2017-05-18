Rails.application.routes.draw do
  scope '/authy' do
    resources :clients
    resources :users
    resources :sessions
  end
end
