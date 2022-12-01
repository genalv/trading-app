class TransactionsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if current_user.admin?
            redirect_to root_path
        else
            @transaction = current_user.transactions   
        end
    end
end
