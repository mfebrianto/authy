# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :set_session, only: %i[show update destroy]

  # GET /sessions
  def index
    @sessions = Session.all

    render json: @sessions
  end

  # GET /sessions/1
  def show
    render json: @session
  end

  # POST /sessions
  def create
    session_interactor = SessionsInteractor.new(params: create_session_params)
    result = session_interactor.create

    return unless result[:success]
    render json: JSONAPI::Serializer.serialize(result[:session]),
           status: :created
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def session_params
    params.require(:session).permit(:session_id, :user_id)
  end

  def create_session_params
    params.require(:login).permit(:username, :password, :client_id)
  end
end
