class University < ActiveRecord::Base
	has_many :faculties,:order =>"name", dependent: :destroy
	validates :name, presence: true, uniqueness: true
	accepts_nested_attributes_for :faculties, allow_destroy: true
end
