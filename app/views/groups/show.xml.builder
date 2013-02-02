xml.instruct!
xml.days do
	@days.each do |day|
		xml.day do
		xml.num(day.num)
		subjects=Subject.find_all_by_day_id(day.id)
		subjects.each do |subject|
			xml.subject do
				xml.name(subject.name)
				xml.num(subject.num)
				xml.teacher(subject.teacher)
				xml.place(subject.place)
				xml.type(subject.sub_type)
			end
		end
		end
	end
end