# class Product < ActiveRecord::Base
# 	validates :title, :description, :image_url, :presence => true
#   validates :price, :numericality => {:greater_than_or_equal_to => 0.01} #:message => "Zero or negative are invalid!! Try again please"}
#   validates :title, :uniqueness => true, # length: { maximum: 10 } #ejercicio pág.108, añadimos una nueva validation, titulo solo 10 caracteres!!
#   validates :image_url, :format => {
#     :with    => %r{\.(gif|jpg|png)$}i,
#     :message => 'must be a URL for GIF, JPG or PNG image.'
#   }
# end

class Product < ActiveRecord::Base
	default_scope :order => 'title' # para ordernar los titulos de los productos alfabeticamente
	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors.add(:base, 'Line Items present' )
			return false
		end
	end
	
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end