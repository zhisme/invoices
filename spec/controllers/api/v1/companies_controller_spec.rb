require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  describe 'POST create' do
    subject { post :create, params: params }
    let(:user) { create :user }

    context 'success' do
      before do
        login_user(user)
      end

      let(:params) { {company: attributes_for(:company)} }

      it { should be_ok }
    end

    context 'failure' do
      context 'unauthorized' do
        let(:params) { {company: attributes_for(:company)} }

        it { expect(subject.status).to eq(401) }
      end

      context 'bad params' do
        before do
          login_user(user)
        end

        let(:params) { {company: attributes_for(:company).merge(title: nil)} }

        it { expect(subject.status).to eq(422) }
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let(:user) { create :user }
    let!(:company) { create :company, user: user }

    context 'success' do
      before do
        login_user(user)
      end

      let(:params) { {company: attributes_for(:company, :standalone)}.merge(id: company.id) }

      it { should be_ok }
    end

    context 'failure' do
      context 'bad params' do
        before do
          login_user(user)
        end

        let(:params) { {company: {title: nil}}.merge(id: company.id) }

        it { should_not be_ok }
      end
    end
  end
end
