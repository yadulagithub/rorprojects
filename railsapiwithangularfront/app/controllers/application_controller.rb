class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  def status
    render json: { data: 'ok' }
  end
end
