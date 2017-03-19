class Product < ActiveRecord::Base
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates_numericality_of :price

	belongs_to :user
	has_many :orders

	self.per_page = 3

end