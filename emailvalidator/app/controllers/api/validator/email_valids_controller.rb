require 'net/http'
require 'json'

class Api::Validator::EmailValidsController < Api::ApplicationController

  #Access token form mail box layer account
  ACCESS_TOKEN = 'cfb503626d97dfc0a447558ad6cd7792'

  rescue_from ActionController::ParameterMissing, with: :render_email_paramter_missing

  api :POST, '/validator/email_valid'
  description 'Check email if it already exists or not'
  param :email, String, desc: 'Email to be validated', required: true
  returns code: :ok, desc: 'Email Valid' do
    property :message, ["Email is vaid"],
              desc: 'Validity check result in words'
    property :valid, [true, false], desc: 'Email valid flag'
  end
  returns code: :bad_request, desc: 'email parameter missing'
  returns code: :not_found, desc: 'Email Invalid' do
    property :message, ["email does not exist as an SMTP domain"],
              desc: 'Validity check result in words'
    property :valid, [false], desc: 'Email valid flag'
  end

  # Runs checking if the email is valid or not
  # Params:
  # - email: email is needed to be checked
  def create
    @email = email_param
    url = "https://apilayer.net/api/check? access_key=#{ACCESS_TOKEN}& email=#{@email}"
    uri = URI(url)
    @response = JSON.parse(Net::HTTP.get(uri))

    if validation_passed?
      render_successful_validation
    else
      render_failed_validation
    end
  end

  private

  def email_param
    params.require(:email)
  end

 #Check if smtp is valid or not
  def validation_passed?
    @response['smtp_check']
  end

  #Handling response when email is valid
  def render_successful_validation
    render json: {
      message: "Email is valid",
    }, status: :ok
  end

 #Handling response when email is not valid
  def render_failed_validation
    render json: {
      message: " #{@email}  sdoes not exist as an SMTP domain",
    }, status: :not_found
  end

  #Handling response when body is empty
  def render_email_paramter_missing
    render json: {
      response: "Parameter email mustn't be blank"
    }, status: :bad_request
  end
end
