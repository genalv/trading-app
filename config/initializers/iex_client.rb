IEX::Api.configure do |config|
    config.publishable_token = 'pk_59bd2077b56943fabea497d004d9b812' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_0004d5d7175f45819d99af39dee0b35a'
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end