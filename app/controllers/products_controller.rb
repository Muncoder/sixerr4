class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    
    if @product.save
      flash[:notice] = "Saved successfully"
      redirect_to @product
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
