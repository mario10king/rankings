require 'nokogiri'
require 'open-uri'

list = []
page = Nokogiri::HTML(open("http://www.coastsoccer.com/2014/SB160P.htm"))
teams = page.css("tbody tr:nth-child(4)")
# teams.each do |team|
# 	list << team.text.gsub(/\r\n/,"").strip
# end

# puts list
# tbody > tr:nth-child(4)
puts teams