class Cart < ApplicationRecord
  validates_presence_of :cart_id
  validates_uniqueness_of :cart_id

  def token
    self.data["token"]
  end
end
