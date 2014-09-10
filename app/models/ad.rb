class Ad < ActiveRecord::Base
	has_many :images,:dependent => :destroy
	accepts_nested_attributes_for :images
    belongs_to :category
    validates :title, presence: true
end
