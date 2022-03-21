# frozen_string_literal: true
require 'rails_helper'

describe Api::V1::CartsController, type: :controller do

  let(:params) do
    {
      cart_id: "123",
      data: {
        token: "xvsnjs6bsu7"
      }
    }
  end

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

  context '#create' do
    subject(:create_cart_response) { post :create, params: params }
    it 'creates new user successfully' do
      expect(create_cart_response).to have_http_status(:created)
    end
  end

  context '#add item' do
    let(:new_item_options) do
      {
        variant_id: 1,
        quantity: 5
      }
    end
    it 'add new item successfully' do
      cart = Cart.create(cart_id: "134")
      cart_params = {id: cart.id}
      post :add_item, params: new_item_options.merge(cart_params)
      expect(response.status).to eq 200
    end
  end
end
