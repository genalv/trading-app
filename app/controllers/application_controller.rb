class ApplicationController < ActionController::Base
    def is_admin?
        if !current_user.admin?
            redirect_to root_path
        end
    end

    def is_trader?
        if current_user.admin?
            redirect_to admin_users_path
        end
    end

    def is_approved?
        if current_user.account_status == "Pending"
            redirect_to root_path
            flash[:notice] = "You need to be approved by the admin."
        end
    end
end