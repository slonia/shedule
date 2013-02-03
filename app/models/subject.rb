 # coding: utf-8
class Subject < ActiveRecord::Base
	belongs_to :group
	validates :day_id, presence: true
	validates :name, presence: true
	S_TYPES=["Лекция","Практика","Семинар","Лабораторная работа","Другое"]
end
