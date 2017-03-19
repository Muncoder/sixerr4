class OrdersController < ApplicationController

	def create
		@order = current_user.orders.create(order_params)
		if @order.save
			flash[:notice] = "Order created successfully"
			redirect_to @order.product
		end
	end

	private

		def order_params
			params.require(:order).permit(:user_id, :product_id, :quantity, :price, :total_price)
		end
end