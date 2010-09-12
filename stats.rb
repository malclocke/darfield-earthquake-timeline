require 'rexml/document'
require 'time'
require 'date'

kml = REXML::Document.new(File.read('earthquakes.kml'))

quakes = {2 => {},3 => {},4 => {},4 => {},5 => {},6 => {},7 => {}}
mindate = maxdate = nil

# Create a hash of all shocks keyed by date
kml.elements.each('//Placemark') do |placemark|
  date = Date.parse(Time.parse(placemark.elements['ExtendedData/Data[@name="date"]/value'].text).localtime.to_s)
  mindate = date if mindate.nil? or date < mindate
  maxdate = date if maxdate.nil? or date > maxdate
  mag = placemark.elements['ExtendedData/Data[@name="mag"]/value'].text.to_f.floor
  quakes[mag][date] = [] if quakes[mag][date].nil?
  quakes[mag][date] << placemark
end

chxl = "0:|#{(mindate..maxdate).collect{|d|d.strftime('%b+%d')}.join('|')}|"

chd = [2,3,4,5,6,7].collect do |mag|
  (mindate..maxdate).collect do |date|
    q = quakes[mag][date]
    q.nil? ? 0 : q.count
  end.join(',')
end.join('|')

puts "http://chart.apis.google.com/chart?cht=bvs&chs=600x400&chxt=x,y&chbh=40,10&chco=67dddd,6991fd,00e64d,fdf569,ff9900,fd7567&chm=N,000000,-1,,12&chtt=Quake+count+by+day&chd=t:#{chd}&chxl=#{chxl}"
