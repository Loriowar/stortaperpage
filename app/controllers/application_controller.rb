class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  ## Changes for using login or email in 'devise'

protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

private

  def layout_by_resource
    if devise_controller?
      "devise/application"
    else
      "storytime/application"
    end
  end
end
