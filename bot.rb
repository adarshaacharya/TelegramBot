require 'telegram_bot'
token = '853873313:AAEzFS7uqNwuBcOda5d506sWgu4YGHnUcxk'
bot = TelegramBot.new(token: token)


bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "Tapailai aadarsha ko bot maa swagat chha !  "

    when /greet/i
          greetings = ['Namaste']
          reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}! Sanchai Hunuhunchha"

    when /help/i
          reply.text = "K help garna sakchhu dai tapailai"


      when /kchhakhabar/i
                    reply.text = "Thikai chha. Timro k chha khabar"

    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
