class Category < ActiveRecord::Base
	has_many :pins
	validates :name, presence: true
end
