class Api::V1::CartsController < Api::V1::BaseController
  before_action :find_cart, only: :add_item

  def create
    # we can use serializer to render the response
    render json: Spree::Cart.new.create, status: :created
  end

  def add_item
    render json: Spree::Cart.new.add_item(@cart.id,item_params), status: 200
  end

  private

  def item_params
    params.permit(:variant_id, :quantity)
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
