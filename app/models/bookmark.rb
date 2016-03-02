class Bookmark < ActiveRecord::Base
	belongs_to :user

	# ensure that a user_id is present
	validates :user_id, presence: true

	#ensure that the title is present and at least 10 charactes long
	validates :title, length: { minimum: 10 }, presence: true

	#ensure the url is prsesent, and respects the url format for http/https
	validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true 
end
