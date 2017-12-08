class Video < ActiveRecord::Base
	belongs_to :category

	validates :title, presence: true
	validates :description, presence: true

	has_many :reviews, -> { order(created_at: :desc) }

	def self.search_by_title(search_term)
		where("title LIKE ?", "%#{search_term}%").order(created_at: :desc)
	end
end
