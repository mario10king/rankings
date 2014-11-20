require 'nokogiri'
require 'open-uri'

list = []
page = Nokogiri::HTML(open("http://www.coastsoccer.com/2014/SB160P.htm"))
teams = page.css("table.StandTable td.StandTeam")
teams.each do |team|
	list << team.text.gsub(/\302\240/,"").strip
end
stats = page.css("table.StandTable td.StandCell")
i = 0
x = 0
games = 0
gp = []
while i < list.length * 6
	games  += stats[i].text.gsub(/\302\240/,"").strip.to_i
    x+=1
    if x % 3 == 0
    	gp << (stats[i+1].text.gsub(/\302\240/,"").strip.to_i / games.to_f).round(2)
    	i += 4 
    	games = 0
	else
    	i+=1
    end
end
arr = list.zip(gp)
sorted = arr.sort {|a,b| b[1] <=> a[1]}
sorted.each do |arr|
	arr.push("PR")
end
p sorted