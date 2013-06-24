# Gesund::Mongoid

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'gesund-mongoid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gesund-mongoid

## Usage

Inside of your `Gesundfile`:

```ruby
check :mongoid_connection, config: "config/mongoid.yml"
```

I advise you to set Mongoid configuration options `max_retries` to `3` so checks won't take too long.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
