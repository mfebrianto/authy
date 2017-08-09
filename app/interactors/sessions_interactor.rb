# frozen_string_literal: true

class SessionsInteractor
  attr_accessor :params, :user

  def initialize(params:)
    @params = params
  end

  def create
    if exist_username? && match_password? && match_client_id?
      session = Session.new(user: @user)
      session.save
    end
    { success: true, session: session }
  end

  private

  def exist_username?
    @user = User.find_by_username(params[:username])
    raise 'user not found' unless @user
    true
  end

  def match_password?
    raise 'password not match' if @user.password != params[:password]
    true
  end

  def match_client_id?
    if @user.client.blank? ||
       (@user.client.present? && @user.client.client_id != params[:client_id])
      raise 'client_id not match'
    end
    true
  end
end
