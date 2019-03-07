class Users::PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.find_or_initialize_with_errors(Devise.reset_password_keys, resource_params, :not_found)
    if self.resource.persisted? && verify_captcha?(resource)
      self.resource.send_reset_password_instructions
    end

    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end
end