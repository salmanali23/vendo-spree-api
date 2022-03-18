class Spree::Cart < Spree::Client
  attr_accessor :client

  CART_URL = '/cart'

  def initialize
    @client = Spree::Client.new
  end

  def create
    response = client.post(CART_URL)
    Cart.create!(
      cart_id: response[:id],
      data: response[:attributes],
      metadata: response.except(:id, :type, :attributes)
    )
  end

  def add_item(cart_id, options)
    cart = Cart.find(cart_id)
    body = {
      body: options.to_json,
      headers: client.headers(cart.token)
    }
    response = client.post("#{CART_URL}/add_item", body)
    cart.update(data: response[:attributes], metadata: response.except(:id, :type, :attributes))
  end
end