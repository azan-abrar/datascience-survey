# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron_log.log"

every 1.day, :at => '4:30 am' do 
   runner "Survey.remove_empty_rows"
end

