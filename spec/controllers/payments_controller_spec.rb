require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:loan) { Loan.create!(funded_amount: 100.0) }

  describe '#create' do
  	context "with  a valid amount" do
  		it "creates a new payment" do
  			expect {
  				post :create, params: {loan_id: loan.id, amount: 20.0}
  			}.to change(Payment, :count).by(1)
  		end
		end

  	context "with an excessive payment amount" do
  		it "does not save the new payment" do
  			expect {
  				post :create, params: {loan_id: loan.id, amount: 110.0}
  			}.to_not change(Payment, :count)
  		end

  		it "responds with 422" do
				post :create, params: {loan_id: loan.id, amount: 110.0}
        expect(response).to have_http_status(:unprocessable_entity)
  		end
		end	
  end

  describe '#index' do
    it 'responds with a 200' do
      get :index, params: {loan_id: loan.id}
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
  	let(:payment) { loan.payments.create!(amount: 2.5) }
    it 'responds with a 200' do
      get :show, params: { id: payment.id, loan_id: loan.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the payment is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000, loan_id: loan.id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end