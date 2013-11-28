require 'uri'
require 'liquid'

module JekyllFileProtocol

  module Jekyll

    class UrlDirectorynameTag < Liquid::Tag

      def initialize(tag_name, param, tokens)
        super
      end

      def render(context)
        uri = URI.parse(context.registers[:page]['url'])

        File.basename(File.dirname(uri.path))
      end

    end

  end

end


Liquid::Template.register_tag 'url_directoryname', JekyllFileProtocol::Jekyll::UrlDirectorynameTag