pdf.font_families.update("Verdana" => {:normal  => "#{Rails.root}/verdana.ttf" })
pdf.font "Verdana", :size => 10
days = Day.find_all_by_group_id(@group.id)
cols=days.size
subs=Array.new(cols)
rows=0
days.each do |day|
	s = Subject.find_all_by_day_id(day.id)
	maxn=s.max_by(&:num).num
	rows=[rows,maxn].max
	mas=Array.new(maxn)
	s.each do |ms|
		unless ms.name=='#пусто#'
			mas[ms.num-1]=ms.name+"\n"+ms.teacher+"\n"+ms.place
		end
	end 
	subs[day.num-1]=mas
end
result = []
max_size = subs.max { |a,b| a.size <=> b.size }.size
max_size.times do |i|
result[i] = Array.new(subs.first.size)
	subs.each_with_index { |r,j| result[i][j] = r[i] }
end
result.insert 0,Day::DAY_NAMES[0...cols]
t = pdf.make_table result
t.draw
