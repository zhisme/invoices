# frozen_string_literal: true

class Api::V1::InvoicesController < Api::V1::BaseController
  def index
    render json: 'success auth!'
  end
end
