class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :create_stock


  def index
    # get quote of the symbol given
    @stock = current_user.stocks.where("shares > ?", 0)
    quote = @client.quote('GGG')
    @test = quote.latest_price
    @new = quote.company_name
    @new2 = quote.high
  end

  def new
  end

  def create
    # begin
    #   @quote = @client.quote(params[:symbol])
    #   @stock = current_user.stocks.find_or_initialize_by(symbol: params[:symbol])
    # end
  end

  private
  def create_stock
    @client = IEX::Api::Client.new
  end
  
end
