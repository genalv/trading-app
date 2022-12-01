class Admin::TransactionsController < ApplicationController
    before_action :is_admin?

    def index
            @transaction = Transaction.all
    end
end

