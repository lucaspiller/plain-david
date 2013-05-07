require 'plain_david/version'
require 'plain_david/strategies/markdown_strategy'
require 'plain_david/strategies/plain_strategy'
require 'plain_david/railtie' if defined?(Rails)

module PlainDavid
  class << self
    def current_strategy
      return config.strategy if config.strategy
      Strategies::MarkdownStrategy.new
    end

    private

    def config
      Rails.application.config.plain_david
    end
  end
end
