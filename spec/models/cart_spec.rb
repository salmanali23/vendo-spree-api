require 'rails_helper'
RSpec.describe Cart, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:cart_id) }
    subject { Cart.new(cart_id: "123") }
    it { should validate_uniqueness_of(:cart_id) }
  end
end
