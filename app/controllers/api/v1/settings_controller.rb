# frozen_string_literal: true

class Api::V1::SettingsController < Api::V1::BaseController
  def index
    render json: current_user.settings
  end

  def change
    if current_user.update(settings: { billing_process: permitted_params })
      render json: current_user.settings
    else
      render json: {}, status: 422
    end
  end

  private

  def permitted_params
    params.require(:setting).require(:billing_process)
  end
end
