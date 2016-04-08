# rubychy
A ruby client for the [Kik bot API](https://dev.kik.com/#/docs/getting-started)

The rubychy library borrows heavily from the great [Telegrammer](https://github.com/mayoral/telegrammer) API, developed by [Luis Mayoral](https://github.com/mayoral)

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
Create a bot using the [Kik](https://dev.kik.com/#/home). Upon registration, you will get to choose a `username` for your bot. Once the `username` is created navigate to the [bot configuration dashboard](https://dev.kik.com/#/engine) where you can find the `API Key`.

Witht your bot `username` and the `API Key` you can use `rubychy` like the following:

```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[USERNAME]', '[API KEY]')
```

If you need to register a `callback` for your bot, do it through `config`:

```ruby
bot.config('[HTTPS CALLBACK URL]')
```

You can also customize the configuration features by passing the features into the config function:
```ruby
bot.config('[HTTPS CALLBACK URL]', Rubychy::DataTypes::Features.new([YOUR CONFIG]))
```

## Sending Messages
With a created bot you can create messages of different type, attach custom keyboards, and pass them through the `send_message` function as follows:
```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[USERNAME]', '[API KEY]')

keyboard = Rubychy::DataTypes::Keyboard.new(
   :to => 'nickcavison',
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
 :title => "Robochy",
 :to => "[TARGET USERNAME]",
 :chatId => '[CHATID]'
)

text_message = Rubychy::DataTypes::Link.new(
 :body => 'Hello World!',
 :title => "[CUSTOM TITLE]", # Optional
 :to => "[TARGET USERNAME]",
 :chatId => '[CHATID]',
 :keyboards => keyboard
)

bot.send_message(link_message, text_message)
```
Robochy supports the existing data types for Kik. Refer to the library for the details.

## Getting User Information
```ruby
require 'rubychy'

bot = Rubychy::Bot.new('[USERNAME]', '[API KEY]')
user_info = bot.get_user('[TARGET USERNAME]') # user_info is of type Rubychy::DataTypes::User
```

## Contributing
- Fork it: https://github.com/nkaviani/rubychy/fork
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create a new Pull Request
