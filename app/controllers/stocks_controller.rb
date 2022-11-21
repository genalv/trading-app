class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :create_stock


  def index
    # get quote of the symbol given
    @stock = current_user.stocks.where("shares > ?", 0)
    # quote = @client.quote('GGG')
    # @test = quote.latest_price
    # @new = quote.company_name
    # @new2 = quote.symbol
  end

  def new
    begin
      @quote = @client.quote(params[:stock_symbol])
      @company_name = @quote.company_name
      @stock_symbol = @quote.symbol
      @price = @quote.latest_price
      
      rescue IEX::Errors::SymbolNotFoundError
          redirect_to stocks_search_path, alert: "Symbol not found"
      end
      @stock = current_user.stocks.build
  end

  def create

    @stock = current_user.stocks.build(stock_params)
    if @stock.save
      redirect_to stocks_path
    else
      redirect_to action: 'new'\
    end
  end

  private
  def create_stock
    @client = IEX::Api::Client.new
  end
  
    def stock_params
        params.require(:stock).permit(:stock_name, :stock_symbol, :stock_price, :shares)
    end
end
