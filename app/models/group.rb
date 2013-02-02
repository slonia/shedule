class Group < ActiveRecord::Base
	has_many :days, :order =>"num", dependent: :destroy
	belongs_to :course
	validates :name, presence: true
	accepts_nested_attributes_for :days, allow_destroy: true
end
