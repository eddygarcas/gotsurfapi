class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_default_format
  before_action :authenticate_token!, except: [:create]

  attr_reader :current_user
  rescue_from ApplicationHelper::SpotError,with: :rescue_404
  rescue_from JWT::ExpiredSignature,with: :rescue_jwt_signature
  rescue_from JWT::DecodeError,with: :rescue_jwt_decode

  def rescue_404
    render json: {errors: ["Spot not found"]},status: :not_found unless @spot.present?
  end

  def rescue_jwt_signature
    render json: {errors: ["Auth token has expired"]}, status: :unauthorized
  end

  def rescue_jwt_decode
    render json: {errors: ["Invalid auth token"]},status: :unauthorized
  end

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    if payload.present?
      @current_user = User.find(payload["sub"])
    end
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization","").split(" ").last
  end

end
