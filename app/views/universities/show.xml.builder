xml.instruct!
xml.faculties do
	xml.date(@faculties.max_by(&:updated_at).updated_at)
	@faculties.each do |faculty|
		xml.faculty do
			xml.name(faculty.name)
			xml.url(root_url+"faculties/"+faculty.id.to_s+".xml")
			end
	end
end