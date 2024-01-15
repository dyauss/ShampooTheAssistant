module MainCommands
  def self.setup_commands(bot)
    bot.message(with_text: 'Shampoo!') do |event|
      message = event.respond 'Oieeee'
      message.pin
    end
    
    bot.message(with_text: '!s pinna') do |event|
      message = event.respond 'Vou pinnar viu'
      message.pin
    end
  end
end