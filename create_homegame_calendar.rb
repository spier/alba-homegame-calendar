require 'rubygems'
require 'bundler/setup'

require 'icalendar'
require 'pp'

def debug_cal(cal)
  puts "--------------------------"
  puts cal.events.size
  puts "--------------------------"

  cal.events.each do |e|
    puts "#{e.uid} | #{e.summary}"
  end
end

def get_cal(filename)
  # Open a file or pass a string to the parser
  cal_file = File.open("a29dcd34.f637522e-c1d948eb.ics")

  # Parser returns an array of events because a single file
  # can have multiple events.
  cals = Icalendar::Calendar.parse(cal_file)
  cal = cals.first
end

def filter_homegames_and_cleanup(cal)
  # only keep the home pages (summary starting with "ALBA BERLIN")
  events = cal.events.select { |event| event.summary =~ /^ALBA BERLIN/ }

  # cleanup the events
  events.each do |event|
    event.description = "" # removing calovo commercials
    event.location.sub!("calovo.de | ","") # removing calovo commercials
    event.url = nil # removing calovo commercials

    # move the game day information to the 'description' field
    match = / (\d+\. Spieltag)/.match(event.summary)
    if match
      event.description = match[1]
      event.summary.sub!(match[0],"")
    end

    # puts event.summary
    event.summary += " [nobody]"
  end

  return events
end

def create_new_calendar(events)
  new_cal = Icalendar::Calendar.new

  # write events to the new calendar
  events.each do |event|
    new_cal.add_event(event)
  end

  return new_cal
end


# ------------------
# MAIN
# ------------------

if ARGV.length < 1
  puts "Too few arguments"
  exit
end

filename = ARGV[1]

cal = get_cal(filename)
# debug_cal(cal)

events = filter_homegames_and_cleanup(cal)
new_cal = create_new_calendar(events)
# debug_cal(new_cal)

# output cleaned-up events (so that they can be redirected to an .ics file of choice)
puts new_cal.to_ical
