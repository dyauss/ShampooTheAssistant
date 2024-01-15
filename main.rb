require 'discordrb'
require 'dotenv'

require_relative './modules/mechanize_commands'
require_relative './modules/google_calendar_commands'
require_relative './modules/main_commands'

Dotenv.load
bot = Discordrb::Bot.new token: ENV.fetch('SHAMPOO_DISCORD_TOKEN')

MechanizeCommands.setup_commands(bot)
GoogleCalendarCommands.setup_commands(bot)
MainCommands.setup_commands(bot)

bot.run