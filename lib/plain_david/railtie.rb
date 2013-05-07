require 'action_mailer'
require 'plain_david'
require 'plain_david/action_mailer_extensions'

module PlainDavid
  class Railtie < Rails::Railtie
    initializer "plain_david.extend_action_mailer" do
      ActiveSupport.on_load(:action_mailer) do
        include PlainDavid::ActionMailerExtensions
      end
    end
  end
end
