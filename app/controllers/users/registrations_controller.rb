# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up


  # POST /resource
  def create
    super do |user|
      user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
    end
  end

  # GET /resource/edit


  # PUT /resource
  def update
    super do |user|
      user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar].present?
    end
  end

  # DELETE /resource


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.


  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation name bio avatar website gender])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password name bio avatar
                                               website gender])
  end
end
