 # coding: utf-8
class Day < ActiveRecord::Base
	belongs_to :group
	has_many :subjects, :order =>"num", dependent: :destroy
	before_save :ensure_days_amount
	DAY_NAMES = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"]
	accepts_nested_attributes_for :subjects, allow_destroy: true

	private

	def ensure_days_amount
		if self.num>6
			raise "Нельзя учиться больше 6 дней!"
		end
	end
end
