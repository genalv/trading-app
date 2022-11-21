class TransactionsController < ApplicationController
    before_action :initiliaze_client

    def new
        @quote = @client.quote(params[:stock_symbol])
        @company_name = @quote.company_name
        @symbol = @quote.symbol
        @price = @quote.latest_price
        rescue IEX::Errors::SymbolNotFoundError
            redirect_to transactions_search_path, alert: "Symbol not found"
    end

    def search

    end

    def index
    end


    private
    def initiliaze_client
        @client = IEX::Api::Client.new
    end
end
