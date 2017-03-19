class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  before_save :set_order_price

  private
  	def set_order_price
  		if self.quantity != nil && self.price != nil 
  			self.total_price = (self.quantity * self.price).round(2)
  		end
  	end

end
