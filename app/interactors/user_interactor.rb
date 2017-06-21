class UserInteractor

  attr_accessor :username, :password, :password_confirmation, :client,
                :client_id, :user

  def initialize(username:, password:, password_confirmation:, client_id:)
    #todo : error message if client not found
    @client = Client.find_by_client_id(client_id)
    @user = User.new(username: username,
                     password: password,
                     password_confirmation: password_confirmation,
                     client: client)
  end

  def create
    if user.save
      session = Session.new(user: user)
      session.save
      { success: true,
        session_id: session.session_id,
        client_id: client.client_id,
        username: session.username }
    else
      { success: false, errors: user.errors.messages }
    end
  end

  def user_valid?

  end

end