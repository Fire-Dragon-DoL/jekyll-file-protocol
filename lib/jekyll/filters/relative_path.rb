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

        node = Nokogiri::XML::DocumentFragment.parse(input)
        tag  = nil

        # Stylesheet
        if tag = node.at_css('link')
          tag['href'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['href']).render
          return tag.to_s
        end

        # Javascript
        if tag = node.at_css('script')
          tag['src'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['src']).render
          return tag.to_s
        end

        # Image
        if tag = node.at_css('img')
          tag['src'] = ::JekyllFileProtocol::RelativePathRenderer.new(@context, tag['src']).render
          return tag.to_s
        end

        tag.to_s
      end

    end
  end
end

Liquid::Template.register_filter JekyllFileProtocol::Jekyll::Filters