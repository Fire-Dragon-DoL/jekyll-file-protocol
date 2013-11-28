require 'uri'
require 'liquid'

module JekyllFileProtocol

  module Jekyll

    class UriFilenameTag < Liquid::Tag

      def render(context)
        uri = URI.parse(context.registers[:page].url)

        File.basename(uri.path, File.extname(uri.path))
      end

    end

  end

end


Liquid::Template.register_tag 'url_filename', Jekyll::AssetsPlugin::UriFilenameTag