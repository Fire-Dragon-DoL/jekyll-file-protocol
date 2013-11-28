require 'uri'
require 'liquid'

module JekyllFileProtocol

  module Jekyll

    class UrlFilenameWithExtTag < Liquid::Tag

      def initialize(tag_name, param, tokens)
        super
      end

      def render(context)
        uri = URI.parse(context.registers[:page]['url'])

        require 'pry'; binding.pry

        File.basename(uri.path)
      end

    end

  end

end


Liquid::Template.register_tag 'url_filename_with_ext', JekyllFileProtocol::Jekyll::UrlFilenameWithExtTag