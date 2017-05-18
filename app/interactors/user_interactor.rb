class UserInteractor

  attr_accessor :username, :password, :password_confirmation, :user

  def initialize(username:, password:, password_confirmation:)
    @user = User.new(username: username,
                     password: password,
                     password_confirmation: password_confirmation)
  end

  def create
    if user.save
      session = Session.new(user: user)
      session.save
      session
    else
      user.errors
    end
  end

end