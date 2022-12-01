class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?

    def index
            @user = User.all
    end
   
    def pending_users
            @user = User.where(account_status: "Pending")
    end

    def edit
         @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to admin_user_path
        end

        # if current_user.admin?
        #     @user = User.find(params[:id])

        #     if @user.update(user_params)
        #         redirect_to admin_user_path
        #     end
        # else
        #     flash[:error] = "Invalid"
        #     redirect_to root_path
        # end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy

        redirect_to admin_users_path
    end


private
    def user_params
        params.require(:user).permit(:email, :account_status)
    end
end