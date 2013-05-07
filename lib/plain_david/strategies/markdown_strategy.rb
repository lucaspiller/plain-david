require 'html2markdown'

module PlainDavid
  module Strategies
    class MarkdownStrategy
      attr_accessor :html

      def initialize(html)
        @html = html
      end

      def convert!
        HTMLPage.new(:contents => html).markdown!
      end
    end
  end
end
