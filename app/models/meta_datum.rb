class MetaDatum < ActiveRecord::Base

	has_many :assets

	validates :heading, :title, :description, :image_count, presence: true
end
