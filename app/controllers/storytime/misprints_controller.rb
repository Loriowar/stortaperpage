require_dependency "storytime/application_controller"

module Storytime
  # @note: inheritance required for proper display of page header, but provide problem with path-helper
  class MisprintsController < ApplicationController

    before_filter :check_permissions

    def index
      @misprints = Misprint.all.order(fixed_at: :desc)
    end

    def create
      result =
          if Misprint.create(create_misprint_params)
            {
                saved: true,
                message: t('controller.misprints.action.create.success_message')
            }
          else
            {
                saved: false,
                message: t('controller.misprints.action.create.error_message')
            }
          end

      respond_to do |format|
        format.json { render json: result }
      end
    end

    def fixed
      misprint = Misprint.find(params.delete(:misprint_id))
      misprint.fixed! unless misprint.fixed?

      # @todo: damned magic due to Storytime multiple site handling (url_for_patch and play with context), most path-helper doesn't work
      redirect_to Rails.application.routes.url_helpers.storytime_misprints_path
    end

  private

    def create_misprint_params
      params.
          require(:misprint).
          permit(
              :page_url,
              :target_text,
              :user_message
          )
    end

    # @todo: in future move this to separate Policy class (Pundit)
    def check_permissions
      if action_name == 'index'
        # explicit specifying of allowed roles instead of specifying disallowed role of 'writer'
        # @todo: needs to implement proper validation for multiple site case
        if !user_signed_in? || (!current_user.storytime_roles.first.try(:editor?) && !current_user.storytime_roles.first.try(:admin?))
          user_not_authorized
        end
      end
    end
  end
end
