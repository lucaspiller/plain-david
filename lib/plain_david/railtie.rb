require 'action_mailer'
require 'plain_david'
require 'plain_david/action_mailer_extensions'

module PlainDavid
  class Railtie < Rails::Railtie
    config.plain_david = ActiveSupport::OrderedOptions.new
    config.plain_david.strategy = PlainDavid::Strategies::MarkdownStrategy

    initializer "plain_david.extend_action_mailer" do
      ActiveSupport.on_load(:action_mailer) do
        include PlainDavid::ActionMailerExtensions
      end
    end
  end
end
