class Api::V1::BaseController < ApplicationController
  attr_reader :current_user

  before_action :ensure_current_user!

  protected

  def ensure_current_user!
    auth_header = request.headers['Authorization']

    return head(401) if auth_header.blank?

    find_current_user(auth_token(auth_header))

    head(401) if current_user.blank?
  end

  def auth_token(auth_header)
    _all, token = auth_header.match(/Bearer\s(.*)/).to_a

    token
  end

  def find_current_user(auth_token)
    @current_user = User.find_by(auth_token: auth_token)
  end
end
