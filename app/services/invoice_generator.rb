##
# Random logic to be changed with some useful
# real-world logic
module InvoiceGenerator
  extend self

  INVOICE_RANGE = (5_000..10_000).freeze

  def call(collection, payeer)
    return if collection.blank?

    assume_all_previous_paid(payeer)

    payeer.invoices.create(
      total: calculate_total(collection),
      due_date: due_date,
      title: title(payeer, collection)
    )
  end

  private

  def title(payeer, collection)
    %(
      #{payeer.class} invoice
      from #{Time.zone.now}
      for Companies
      #{collection.map(&:title).join(', ')}
    ).strip
  end

  def assume_all_previous_paid(payeer)
    payeer.invoices.not_paid.each(&:paid!)
  end

  def calculate_total(collection)
    collection.reduce(0) do |sum, company|
      sum + company.locations.count * rand(INVOICE_RANGE)
    end
  end

  def due_date(delta = 1.month)
    Time.zone.now + delta
  end
end
