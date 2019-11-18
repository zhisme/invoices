##
# This service supposed to be called at the end
# of billing cycle. So in controller we assume, that it would be
# called at end of billing cycle just for simplicity.
module ProcessInvoices
  extend self

  def call(user)
    per_company, per_user = user.companies.partition(&:standalone?)

    company_invoices = per_company.map { |company| InvoiceGenerator.call([company], company) }
    user_invoice = InvoiceGenerator.call(per_user, user)

    company_invoices.concat([user_invoice]).compact
  end
end
