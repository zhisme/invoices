class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :find_company, only: :update

  attr_reader :company

  def create
    company = Company.new(permitted_params.merge(user: current_user))

    if company.save
      rand(1..5).to_i.times { |idx| company.locations.create(title: "Location #{company.id}.#{idx}") }

      render json: company
    else
      render json: {error: 'Cannot be processed'}, status: 422
    end
  end

  def update
    if company.update(permitted_params)
      render json: company
    else
      render json: {error: 'Cannot be processed'}, status: 422
    end
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def permitted_params
    params.require(:company).permit(:title, settings: [:billing_process])
  end
end
