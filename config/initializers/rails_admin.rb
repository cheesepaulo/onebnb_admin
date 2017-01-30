RailsAdmin.config do |config|
  config.main_app_name = Proc.new { |controller| [ "OneBnb", "Admin - #{controller.params[:action].try(:titleize)}" ] }

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    if current_user.kind != "admin"
      reset_session
      redirect_to '/users/sign_in'
    end
  end

  config.excluded_models << "Photo"

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
