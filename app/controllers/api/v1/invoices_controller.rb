class Api::V1::InvoicesController < Api::V1::BaseController
  def index
    my_invoices = ProcessInvoices.call(current_user)

    render json: InvoiceSerializer.new(my_invoices)
  end
end
