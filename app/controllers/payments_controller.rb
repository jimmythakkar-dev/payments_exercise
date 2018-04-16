class PaymentsController < ActionController::API

	include ExceptionHandler

	before_action :get_loan_resource

  def index
    render json: @loan.payments
  end

  def show
    render json: @loan.payments.find(params[:id])
  end

  def create
    render json: @loan.payments.create!(payment_params), status: :created
  end

  private

  def payment_params
    params.permit(:amount, :loan_id)
  end

  def get_loan_resource
  	@loan = Loan.find(params[:loan_id])
  end	
end