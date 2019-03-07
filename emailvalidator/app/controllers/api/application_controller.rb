class Api::ApplicationController < ActionController::API
  rescue_from Exception, with: :render_exception_response

  def render_exception_response
    render json: { response: "You must send email parameter in body" }, status: :unprocessable_entity
  end
end
