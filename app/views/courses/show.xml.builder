xml.instruct!
xml.groups do
	xml.date(@groups.max_by(&:updated_at).updated_at)
	@groups.each do |group|
		xml.group do
			xml.name(group.name)
			xml.url(root_url+"groups/"+group.id.to_s+".xml")
			end
	end
end