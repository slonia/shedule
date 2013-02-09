module ApplicationHelper

	def link_to_add_fields(name, f, association)
    	new_object = f.object.send(association).klass.new
    	id = new_object.object_id
    	fields = f.fields_for(association, new_object, child_index: id) do |builder|
      		render(association.to_s.singularize + "_fields", f: builder)
   		end
    	button_to_function(name, '#', class: "add_fields btn btn-success btn-small", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def bootstrap_shortener(long_names)
  		size=long_names.size*2
  		ar = Array.new(size);
    	(0...size).step(2) do |n|
    	  id=long_names[n/2].id
  			name=long_names[n/2].name
    		ar[n]=[name,id, class: 'primary']
    		ar[n+1]=[name.split(' ').map{|i| i=i.slice(0...1)}.join(''),id, class: 'other']
    	end
  		ar
  end
end
