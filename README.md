
# rubychy
<table border="0">
<tr>
<td width="200px">
<img src="https://s3-us-west-2.amazonaws.com/robochyassets/rubychy/rubychy-logo-transparent.png" alt="Rubychy" height="150px"/> 
</td>
<td>
A ruby client for the <a href="https://dev.kik.com/#/docs/getting-started">Kik bot API</a> provided by <a href="http://robochy.com">Robochy</a>.
</td>
</tr>
</table>

The rubychy library borrows heavily from the [Telegrammer](https://github.com/mayoral/telegrammer) API, developed by [Luis Mayoral](https://github.com/mayoral)

## Installation

Add the gem to your application's Gemfile

```ruby
gem 'rubychy'
```

and run the following

```ruby
$ bundle install
```

## Usage
Create a bot using the [Kik](https://dev.kik.com/#/home) developer portal. Upon registration, you will get to choose a `username` for your bot. Once the `username` is created navigate to the [bot configuration dashboard](https://dev.kik.com/#/engine) where you can find the `API Key`.

With your bot `username` and the `API Key` you can use `rubychy` like the following:

```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[BOT USERNAME]', '[API KEY]')
```

If you need to register a `callback` for your bot, do it by calling `config`:

```ruby
bot.config('[HTTPS CALLBACK URL]')
```

You can also customize the configuration features by passing the features into the config function:
```ruby
bot.config('[HTTPS CALLBACK URL]', Rubychy::DataTypes::Features.new([YOUR CONFIG]))
```

## Sending Messages
With a created bot you can create messages of different types, attach custom keyboards, and pass them through the `send_message` function as follows:
```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[BOT USERNAME]', '[API KEY]')

keyboard = Rubychy::DataTypes::Keyboard.new(
   :to => '[RECIPIENT USERNAME]',
   :hidden => true,
   :responses => [
      Rubychy::DataTypes::KeyboardResponse.new(
         type: "text",
         body: "hi"
      ),
      Rubychy::DataTypes::KeyboardResponse.new(
         type: "text",
         body: "bye"
      )
   ]
)

link_message = Rubychy::DataTypes::Link.new(
 :url => 'http://robochy.com',
 :title => "Robochy", # Optional
 :to => "[RECIPIENT USERNAME]",
 :chatId => '[CHATID]'
)

text_message = Rubychy::DataTypes::Text.new(
 :body => 'Hello World!',
 :to => "[RECIPIENT USERNAME]",
 :chatId => '[CHATID]',
 :keyboards => keyboard
)

bot.send_message(link_message, text_message)
```
Rubychy supports the existing data types for Kik. Refer to the library for the details.

## Getting User Information
```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[BOT USERNAME]', '[API KEY]')
user_info = bot.get_user('[TARGET USERNAME]') # user_info is of type Rubychy::DataTypes::User
```

## Parsing the Response

In your callback servlet:

```ruby
class Simple < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    kik_response = Rubychy::ApiResponse.parse(request) # kik_response is of type Rubychy::DataTypes::ReceivedMessages
  end
end
```

## Contributing
- Fork it: https://github.com/nkaviani/rubychy/fork
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create a new Pull Request
