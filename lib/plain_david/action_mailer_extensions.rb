require 'html2markdown'

module PlainDavid
  module ActionMailerExtensions
    extend ActiveSupport::Concern

    included do
      if method_defined?(:collect_responses)
        alias_method_chain :collect_responses, :text_part
      else
        alias_method_chain :collect_responses_and_parts_order, :text_part
      end
    end

    protected

    # Rails 4
    def collect_responses_with_text_part(headers, &block)
      responses = collect_responses_without_text_part(headers, &block)

      html_part, text_part = detect_parts(responses)
      if html_part && !text_part
        text_body = generate_text_body(html_part[:body])
        responses.insert 0, { content_type: "text/plain", body: text_body }
      end

      responses
    end

    # Rails 3
    def collect_responses_and_parts_order_with_text_part(headers, &block)
      responses, order = collect_responses_and_parts_order_without_text_part(headers, &block)

      html_part, text_part = detect_parts(responses)
      if html_part && !text_part
        text_body = generate_text_body(html_part[:body])
        responses.insert 0, { content_type: "text/plain", body: text_body }
        order && order.insert(0, "text/plain")
      end

      [responses, order]
    end

    def detect_parts(responses)
      html_part = responses.detect { |response| response[:content_type] == "text/html" }
      text_part = responses.detect { |response| response[:content_type] == "text/plain" }
      return html_part, text_part
    end

    def generate_text_body(html)
      # TODO allow different plain text generation strategies
      HTMLPage.new(:contents => html).markdown!
    end
  end
end
