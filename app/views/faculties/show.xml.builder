xml.instruct!
xml.courses do
	xml.date(@courses.max_by(&:updated_at).updated_at)
	@courses.each do |course|
		xml.course do
			xml.num(course.num)
			xml.url(root_url+"courses/"+course.id.to_s+".xml")
			end
	end
end