class SessionsInteractor

  attr_accessor :params

  def initialize(params:)
    @params = params
  end

  def create
    user = User.new({username: params[:username],
                     password: params[:password],
                     client_id: params[:client_id],
                     state: 'check'})
    user.valid?
    false
  end

end