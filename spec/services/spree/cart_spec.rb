require 'webmock/rspec'
require 'rails_helper'

describe Spree::Cart do
  let(:cart_response) do
    {
      data:
      {
        id: "123456789",
        attributes: {
          token: "cxgssajxbusdbcds"
        },
        metadata: {
          time: Time.now
        }
      }
    }
  end

  let(:item_response) do
    {
      data:
      {
        attributes:
        {
          variant_id: 1,
          quantity: 5
        }
      }
    }
  end

  describe '#cart' do
    context 'it creates a new cart' do

      let(:new_item_options) do
        {
          variant_id: 1,
          quantity: 5
        }
      end

      before do
        stub_request(:post, "https://demo.spreecommerce.org/api/v2/storefront/cart").
          with(
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Ruby'
              }).
          to_return(status: 200, body: JSON.generate(cart_response), headers: {"content-type"=>["application/json; charset=UTF-8"]})

        stub_request(:post, "https://demo.spreecommerce.org/api/v2/storefront/cart/add_item").
          with(
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: JSON.generate(item_response), headers: {"content-type"=>["application/json; charset=UTF-8"]})
      end

      it 'sucessfully creates cart' do
        cart = Spree::Cart.new.create
        expect(cart.cart_id).to eq 123456789
        expect(cart.data["token"]).to eq "cxgssajxbusdbcds"
      end

      it 'successfully add a new item to cart' do
        cart_service = Spree::Cart.new
        cart = cart_service.create
        cart_service.add_item(cart.id, new_item_options)
        expect(cart.reload.data["variant_id"]).to eq 1
        expect(cart.reload.data["quantity"]).to eq 5
      end
    end
  end
end
