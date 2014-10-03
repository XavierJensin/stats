

f = File.new("mydata.dat", "r")
data = f.readlines
f.close

stat = data.collect do |average|
	average = average.split ("\t")
	average[1].to_f
end

sum = 0
amount = stat.length
stat.each do |average|
	sum = sum + average.to_f
end
average = sum/amount


variences = stat.collect do |stat| 
	number = stat - average
	number_squared = number**2	
end

sum2 = 0
amount2 = stat.length
variences.each do |number_squared|
	sum2 = sum2 + number_squared.to_f
end
average2 = sum2/amount2

standard_deviation = Math.sqrt(average2)

zscores = stat.collect do |stat|
	(stat - average)/standard_deviation
end
puts zscores

f = File.new("otherfile.dat", "w")
f.puts (zscores) 
