# Payments Exercise

Please migrate the database before running the application.

I have implemented a JSON api to create payments along with outstanding balance validation for a given loan. That API is : 
POST   /loans/:loan_id/payments
Parameters : amount
If the payment amount is greater than the outstanding balance, it will not allow the payment to be created and will give a 422 error response.

I have also added the outstanding balance for a given loan and vended it in JSON for `LoansController#show` and `LoansController#index`.

All the payments for a given loan can be viewed at /loans/:loan_id/payments which is a get request and for viewing the individual payment of a loan please call /loans/:loan_id/payments/:id which is also a get request.

I also also specs for PaymentsController.