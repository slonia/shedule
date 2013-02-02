xml.instruct!
xml.universities do
	xml.date(@universities.max_by(&:updated_at).updated_at)
	@universities.each do |university|
		xml.university do
			xml.name(university.name)
			xml.url(root_url+"universities/"+university.id.to_s+".xml")
		end
	end
end