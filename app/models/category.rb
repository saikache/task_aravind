class Category < ActiveRecord::Base
  has_many :ads
  validates :name, presence: true, uniqueness: true
end
