SimpleForm.setup do |config|
  config.wrappers :device_wrapper,  tag: :div,
                                    class: 'devise-form-group',
                                    error_notification: 'error-notification',
                                    hint_class: 'device-hint',
                                    error_class: 'device-has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.use :label
    b.wrapper tag: :div, class: :controls do |ba|
      ba.use :input
      ba.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :error, wrap_with: { tag: 'p', class: 'error-inline' }
    end
  end
end