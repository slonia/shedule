class Course < ActiveRecord::Base
	has_many :groups, :order =>"name", dependent: :destroy
	belongs_to :faculty
	validates :num, presence: true
end
