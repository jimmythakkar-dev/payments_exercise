class Payment < ApplicationRecord
	belongs_to :loan

	validate :outstanding_amount_validation

	private

	def outstanding_amount_validation
		if amount > loan.get_outstanding_balance
			errors.add(:amount, "must be less than the outstanding balance of the loan.")
		end
	end
end
