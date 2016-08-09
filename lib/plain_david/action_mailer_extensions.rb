module PlainDavid
  module ActionMailerExtensions
    extend ActiveSupport::Concern

    protected

    # Rails 4
    def collect_responses(headers, &block)
      responses = super(headers, &block)

      html_part, text_part = detect_parts(responses)
      if html_part && !text_part
        text_body = generate_text_body(html_part[:body])
        responses.insert 0, { content_type: "text/plain", body: text_body }
      end

      responses
    end

    # Rails 3
    def collect_responses_and_parts_order(headers, &block)
      responses, order = super(headers, &block)

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
      PlainDavid.current_strategy.new(html.to_str).convert!
    end
  end
end
