class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    user_interactor = UserInteractor.new(create_params)
    result = user_interactor.create

    render json: result, status: status(result)
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

    def create_params
      {
        username: user_params[:username],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation],
        client_id: user_params[:client_id]
      }
    end

    def user_params
      params.require(:user).permit(:username,
                                   :password,
                                   :password_confirmation, :client_id)
    end

    def status(result)
      result[:success] ? :created : :unprocessable_entity
    end
end
