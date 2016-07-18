class User::ParameterSanitizer < Devise::ParameterSanitizer
  def attributes_for(kind)
    allowed_keys = super
    case kind
      when :sign_in
        allowed_keys
      when :sign_up
        allowed_keys + [:storytime_name, :email, :remember_me]
      when :account_update
        allowed_keys + [:storytime_name, :email, :remember_me]
    end.uniq
  end
end