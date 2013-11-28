require 'nokogiri'
require 'jekyll-file-protocol/relative_path_renderer'

module JekyllFileProtocol

  module Jekyll

    module Filters

      def relative_path(input)
        return input if input.nil?

        ::JekyllFileProtocol::RelativePathRenderer.new(@context, input).render
      end

      def relative_tag(input)
        return input if input.nil?

        node   = Nokogiri::HTML.parse(input)
        tags   = nil
        
        # Stylesheet
        if tags = node.css('link').to_a
          return tags.map do |tag|
            tag['href'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['href']).render
            tag
          end.map(&:to_html)
        end

        # Javascript
        if tags = node.css('script').to_a
          return tags.map do |tag|
            tag['src'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['src']).render
            tag
          end.map(&:to_html)
        end

        # Image
        if tags = node.css('img').to_a
          return tags.map do |tag|
            tag['src'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['src']).render
            tag
          end.map(&:to_html)
        end

        input
      end

    end
  end
end

Liquid::Template.register_filter JekyllFileProtocol::Jekyll::Filters