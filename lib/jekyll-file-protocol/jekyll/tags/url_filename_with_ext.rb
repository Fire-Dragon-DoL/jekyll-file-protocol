require 'uri'
require 'liquid'

module JekyllFileProtocol

  module Jekyll

    class UrlFilenameWithExtTag < Liquid::Tag

      def render(context)
        uri = URI.parse(context.registers[:page].url)

        File.basename(uri.path)
      end

    end

  end

end


Liquid::Template.register_tag 'url_filename_with_ext', Jekyll::AssetsPlugin::UrlFilenameWithExtTag