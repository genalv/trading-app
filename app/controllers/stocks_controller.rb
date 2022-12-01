class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :create_stock
  before_action :is_trader?
  before_action :is_approved?, only: [:buy_stock, :sell_stock]
  before_action :prevent_error_sell_stock, only: [:update]

  def index
      @stock = current_user.stocks.where("shares > ?", 0)

    
    # quote = @client.quote('GGG')
    # @test = quote.latest_price
    # @new = quote.company_name
    # @new2 = quote.symbol
  end

  def new
    begin
      quote = @client.quote(params[:stock_symbol])

      redirect_to buy_stock_path(params[:stock_symbol])
      
      rescue IEX::Errors::SymbolNotFoundError
          redirect_to stocks_search_path, alert: "Symbol not found"
      end
  end

  def create
    if (stock_params[:shares].to_i <= 0)
      redirect_to stocks_search_path
    else
      @quote = @client.quote(stock_params[:stock_symbol])
      @company_name = @quote.company_name
      @stock_symbol = @quote.symbol
      @price = @quote.latest_price

      @stock = current_user.stocks.find_or_initialize_by(stock_symbol: stock_params[:stock_symbol])
      @stock.shares += stock_params[:shares].to_i
      @stock.stock_name = @company_name
      @stock.stock_symbol = @stock_symbol
      @stock.stock_price = @price
      @value = stock_params[:shares].to_i * @price


      if @stock.save
        current_user.transactions.create(company_name: @company_name, shares: stock_params[:shares], share_price: @price, action_type: 'Buy', stock_price: @price, stock_symbol: @stock_symbol, value: @value)
        redirect_to stocks_path
      else
        redirect_to action: 'new'
      end
    end
  end

  def buy_stock
    begin
      @quote = @client.quote(params[:symbol])
      @company_name = @quote.company_name
      @stock_symbol = @quote.symbol
      @price = @quote.latest_price
      
      @stock = current_user.stocks.build
      # @quote = @client.quote(params[:stock_symbol])
      # @stock = current_user.stocks.find_or_initialize_by(params[:symbol])
      # @quote = @client.quote(@test.symbol)
      # @stock_symbol = @quote.symbol



      # @user_stocks_own = current_user.stocks.find_by(stock_symbol: params[:symbol])
      # # @stock = current_user.stocks.find_or_initialize_by(params[:symbol])
      # @quote = @client.quote(@test.symbol)
      # @stock_symbol = @quote.symbol
      # @user_stocks_own = current_user.stocks.find_by(stock_symbol: params[:symbol])
      # # @shares = current_user.stocks.find_or:stock_symbol])
      # # @user_shares = current_user.stocks.shares.where(stock_symbol: params)_initialize_by(stock_symbol: params[
      # @company_name = @quote.company_name
      # # @stock_symbol = @quote.symbol
      # @price = @quote.latest_price

      # rescue IEX::Errors::SymbolNotFoundError
      #   redirect_to stocks_search_path, alert: "Symbol not found"

      # @stock = current_user.stocks.find_or_initialize_by(stock_symbol: params[:symbol])
    end
  end

  def update
    @quote = @client.quote(stock_params[:stock_symbol])
    @company_name = @quote.company_name
    @stock_symbol = @quote.symbol
    @price = @quote.latest_price
    @stock = current_user.stocks.find_or_initialize_by(stock_symbol: stock_params[:stock_symbol])
    @stock.shares -= stock_params[:shares].to_i
    @stock.stock_name = @company_name
    @stock.stock_symbol = @stock_symbol
    @stock.stock_price = @price
    @value = stock_params[:shares].to_i * @price

    if @stock.save
      current_user.transactions.create(company_name: @company_name, shares: stock_params[:shares].to_i, share_price: @price, action_type: 'Sell', stock_price: @price, stock_symbol: @stock_symbol, value: @value)
      redirect_to stocks_path
    else
      redirect_to action: 'new'
    end
  end

  def destroy

  end


  def sell_stock
    begin
      @quote = @client.quote(params[:symbol])
      @company_name = @quote.company_name
      @stock_symbol = @quote.symbol
      @price = @quote.latest_price
      
      @stock = current_user.stocks.find_by(stock_symbol: params[:symbol])
    end
  end


  private
  def create_stock
    @client = IEX::Api::Client.new
  end
  
  def stock_params
    params.require(:stock).permit(:stock_name, :stock_symbol, :stock_price, :shares)
  end

  def prevent_error_sell_stock
    @quote = @client.quote(stock_params[:stock_symbol])
    @company_name = @quote.company_name
    @stock_symbol = @quote.symbol
    @price = @quote.latest_price
    @stock = current_user.stocks.find_or_initialize_by(stock_symbol: stock_params[:stock_symbol])
    if stock_params[:shares].to_i > @stock.shares
      flash[:notice] = "Invalid, you don't have enough shares."
      redirect_to stocks_path
    end
  end
end
