class Loan < ActiveRecord::Base
	has_many :payments, dependent: :destroy

  def as_json(options={})
    super.as_json(options).merge({outstanding_balance: get_outstanding_balance})
  end

  def get_outstanding_balance
  	self.funded_amount - payments.map(&:amount).sum
  end
end
