class InvoiceSerializer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def as_json(*_args)
    {
      invoices: invoices,
    }
  end

  private

  def invoices
    data.map do |invoice|
      invoice.slice(:id, :title, :due_date, :status, :total).
        merge(billable: invoice.billable_type)
    end
  end
end
