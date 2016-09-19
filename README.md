# Plain David

Plain David automatically generatess a text part for your HTML emails.

## Install

Add the gem to Rails' Gemfile

    gem 'plain-david'

## Usage

Nothing. Just send emails as normal, and a text part will be automatically generated. The email will be changed from HTML to multipart like magic!

It works seamlessly with css inliners like [Roadie](https://github.com/kandadaboggu/roadie).

Works with Rails 3, 4 and 5.

## Conversion Strategies

You can set your own conversion strategy. The default `MarkdownStrategy` converts the HTML to Markdown. If you want to use your own you just need to set the `strategy` option.

For example, in your `application.rb`:

```ruby
class AwesomeStrategy
  attr_accessor :html

  def initialize(html)
    @html = html
  end

  def convert!
    @html.awesomize!
  end
end

config.plain_david.strategy = AwesomeStrategy
```

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

## License

MIT License. See `LICENSE` for details.

## Copyright

Copyright (c) 2013-2016 Luca Spiller.
