 # coding: utf-8
class Subject < ActiveRecord::Base
	belongs_to :group
	S_TYPES=["Лекция","Практика","Семинар","Лабораторная работа","Другое"]
end
