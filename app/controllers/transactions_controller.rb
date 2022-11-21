class TransactionsController < ApplicationController
    # before_action :initiliaze_client

    # def new
    #     @quote = @client.quote(params[:stock_symbol])
    #     @company_name = @quote.company_name
    #     @stock_symbol = @quote.symbol
    #     @price = @quote.latest_price

    #     rescue IEX::Errors::SymbolNotFoundError
    #         redirect_to transactions_search_path, alert: "Symbol not found"
    
    #     @stock = Stock.new
    # end

    # def create
    #     @stock = curent_user.stocks.find_or_initialize_by(stock_params)
        
    #     if @stock.save
    #         redirect_to stock_path
    #     else
    #         render :new
    #     end 
    #     # # begin
    #     # #     @quote = @client.quote(params[:symbol])
    #     # #     @stock = current_user.stocks.find_or_initialize_by(symbol: params[:symbol])
    #     # # end
    # end

    # def search

    # end

    # def index
    # end


    # private
    # def initiliaze_client
    #     @client = IEX::Api::Client.new
    # end

    # def stock_params
    #     params.require(:stock).permit(:stock_name, :stock_symbol, :stock_price, :shares)
    # end
end
