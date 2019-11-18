require 'rails_helper'

RSpec.describe InvoiceGenerator do
  describe '.call' do
    subject { described_class.call(collection, payeer) }

    let(:user) { create :user }

    context '1 invoice per user' do
      let(:collection) { create_list(:company, 3, user: user) }
      let(:payeer) { user }

      it { expect { subject }.to change { Invoice.count }.by(1) }
      it { expect { subject }.to change { user.reload.invoices.count }.by(1) }
    end

    context 'many per company' do
      let(:company) { create :company, :standalone, user: user }
      let(:payeer) { company }
      let(:collection) { [company] }

      it { expect { subject }.to change { user.reload.invoices.count }.by(0) }
      it { expect { subject }.to change { company.reload.invoices.count }.by(1) }
    end

    context 'pays previous one' do
      let(:collection) { create_list(:company, 3, user: user) }
      let(:payeer) { user }

      before do
        create :invoice, billable_id: user.id, billable_type: user.class
      end

      it do
        subject
        expect(user.invoices.count).to eq(2)
      end
      it { expect { subject }.to change { Invoice.count }.by(1) }
      it { expect { subject }.to change { user.reload.invoices.count }.by(1) }
      it { expect { subject }.to change { user.reload.invoices.first.status }.from('not_paid').to('paid') }
    end

    context 'none for empty collection' do
      let(:collection) { [] }
      let(:payeer) { user }

      it { expect { subject }.to change { Invoice.count }.by(0) }
      it { is_expected.to eq(nil) }
    end
  end
end
