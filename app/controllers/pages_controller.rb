class PagesController < ApplicationController
  def home
  end

  def my_purchases
  	@purchases = current_user.orders.order("created_at DESC")
  end

  def my_sales
  	@sales = current_user.products
  end

  def search
  	@products = Product.search(params[:q])
  end

end
