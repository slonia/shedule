class Faculty < ActiveRecord::Base
	has_many :courses, :order =>"num", dependent: :destroy
	belongs_to :university
	validates :name, presence: true, uniqueness: true
	accepts_nested_attributes_for :courses, allow_destroy: true
end
