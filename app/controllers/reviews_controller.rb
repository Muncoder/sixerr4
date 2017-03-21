class ReviewsController < ApplicationController

	def index

	end

	def create
		@review = current_user.reviews.create(review_params)

		if @review.save
			flash[:notice] = "Review submitted...."
			redirect_to @review.product
		else
			flash[:notice] = "Could not submit review...."
			render "new"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		product = @review.product

		@review.destroy
		flash[:notice] = "Review deleted successfully..."
		redirect_to product
	end	

	private
		def review_params
			params.require(:review).permit(:user_id, :product_id, :star, :comment)
		end


end