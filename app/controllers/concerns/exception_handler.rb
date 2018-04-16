module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: 'not_found', status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: exception.message, status: :unprocessable_entity
    end
  end
end