class ApplicationController < ActionController::Base

    private
  
      def ensure_current_user_is_admin!
        authenticate_user!
  
        unless current_user.admin?
          redirect_to root_path, status: :forbidden, alert: "Unauthorized Access!"
        end
      end
end
