require 'rails_helper'

RSpec.describe ProcessInvoices do
  describe '.call' do
    subject { described_class.call(user) }

    let(:user) { create :user }
    let(:user_invoice) { create :invoice, billable_id: user.id, billable_type: user.class }
    let(:comp_invoice) { create :invoice, billable_id: company.id, billable_type: company.class }

    context 'both types' do
      let!(:company) { create :company, :standalone, user: user }
      let!(:companies) { create_list :company, 2, user: user }

      before do
        per_company, per_user = user.companies.partition(&:standalone?)

        per_company.each do |company|
          allow(InvoiceGenerator).to receive(:call).with([company], company).and_return(comp_invoice)
        end

        allow(InvoiceGenerator).to receive(:call).with(per_user, user).and_return(user_invoice)
      end

      it do
        expect(subject).to eq([comp_invoice] + [user_invoice])
      end
    end

    context 'only user' do
      let!(:companies) { create_list :company, 2, user: user }

      before do
        _per_company, per_user = user.companies.partition(&:standalone?)

        allow(InvoiceGenerator).to receive(:call).with(per_user, user).and_return(user_invoice)
      end

      it do
        expect(subject).to eq([user_invoice])
      end
    end

    context 'only company' do
      let!(:company) { create :company, :standalone, user: user }

      before do
        per_company, per_user = user.companies.partition(&:standalone?)

        per_company.each do |company|
          allow(InvoiceGenerator).to receive(:call).with([company], company).and_return(comp_invoice)
        end

        allow(InvoiceGenerator).to receive(:call).with(per_user, user).and_return(nil)
      end

      it do
        expect(subject).to eq([comp_invoice])
      end
    end
  end
end
