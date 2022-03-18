class Spree::Client
  include HTTParty
  base_uri 'https://demo.spreecommerce.org/api/v2/storefront/'

  def initialize
    #we can implemnt auth here in future
  end

  def post(url , options={})
    json_response(self.class.post(url,options))
  end

  def headers(token)
    {
      "Content-Type": "application/json",
      "X-Spree-Order-Token": token
    }
  end

  def json_response(response)
    raise response["error"] if response.has_key?("error")
    JSON.parse(response.body)['data'].deep_symbolize_keys
  end
end