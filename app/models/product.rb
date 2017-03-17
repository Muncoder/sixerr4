class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates_numericality_of :price
end