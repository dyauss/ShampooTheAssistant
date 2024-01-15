require 'mechanize'
require_relative '../HtmlParser'

module MechanizeCommands
  def self.setup_commands(bot)
    agent = Mechanize.new
    agent.html_parser = HtmlParser

    bot.message(with_text: 'Ryujin tem foto nova?') do |event|
      page = agent.get('https://kpopping.com/profiles/idol/Ryujin')
      tags_found = page.search('#idol-latest-pictures .matrix .cell')
    
      href_value = tags_found[0]['href']
      full_string = 'https://kpopping.com' + href_value
    
      event.respond full_string
    end
      
    bot.message(with_text: 'Yeji tem foto nova?') do |event|
      page = agent.get('https://kpopping.com/profiles/idol/Yeji')
      tags_found = page.search('#idol-latest-pictures .matrix .cell')
    
      href_value = tags_found[0]['href']
      full_string = 'https://kpopping.com' + href_value
    
      event.respond full_string
    end
      
    bot.message(with_text: 'Dahyun tem foto nova?') do |event|
      page = agent.get('https://kpopping.com/profiles/idol/Dahyun')
      tags_found = page.search('#idol-latest-pictures .matrix .cell')
    
      href_value = tags_found[0]['href']
      full_string = 'https://kpopping.com' + href_value
    
      event.respond full_string
    end
      
    bot.message(with_text: 'Mina tem foto nova?') do |event|
      page = agent.get('https://kpopping.com/profiles/idol/Mina2')
      tags_found = page.search('#idol-latest-pictures .matrix .cell')
    
      href_value = tags_found[0]['href']
      full_string = 'https://kpopping.com' + href_value
    
      event.respond full_string
    end
  end
end