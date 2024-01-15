require 'google/apis/calendar_v3'
require 'googleauth'
require 'date'

require_relative '../CalendarQuickstart'

module GoogleCalendarCommands
  def self.setup_commands(bot)
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = CalendarQuickstart.get_credentials

    bot.message(with_text: '!s unique google') do |event|
      calendar = Google::Apis::CalendarV3::CalendarService.new
      calendar.authorization = CalendarQuickstart.get_credentials
    end
    
    bot.message(with_text: '!s get') do |event|
      calendar_id = 'primary'
      start_of_today = DateTime.now.new_offset(0).to_time.iso8601
      end_of_today = (DateTime.now.new_offset(0) + 1).to_time.iso8601
    
      calendar_events = calendar.list_events(
        calendar_id,
        single_events: true,
        order_by: 'startTime',
        time_min: start_of_today,
        time_max: end_of_today
      )
    
      if calendar_events.items.any?
        s = StringIO.new
        calendar_events.items.each do |calendar_event|
          s.puts "#{calendar_event.summary} - #{calendar_event.start.date_time}"
        end
        event.respond s.string
      else
        event.respond 'Nenhum evento encontrado para o período de tempo especificado.'
      end
    end
    
    bot.message(with_text: '!s google calendar') do |event|
      # calendar = Google::Apis::CalendarV3::CalendarService.new
      string = CalendarQuickstart.send_url_authorizer
      # calendar.authorization = CalendarQuickstart.get_credentials
    
      message1 = event.respond 'Vou te enviar uma url, autorize o app e guarde o código'
      message2 = event.respond string
    end
    
    bot.message(start_with: '!s store') do |event|
      string = event.content
      final_string = string.gsub!('!s store', '')
      CalendarQuickstart.set_code(final_string.chomp)
      event.respond final_string
    end
  end
end