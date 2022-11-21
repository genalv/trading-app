class Stock < ApplicationRecord
    belongs_to :user
    
    def self.search(stock_symbol)

        client = IEX::Api::Client.new(
            publishable_token: 'pk_59bd2077b56943fabea497d004d9b812',
            secret_token: 'sk_0004d5d7175f45819d99af39dee0b35a',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
        new(stock_symbol: stock_symbol, stock_name: client.company(stock_symbol).company_name, stock_price: client.quote(stock_symbol.stock_price))
    end

end