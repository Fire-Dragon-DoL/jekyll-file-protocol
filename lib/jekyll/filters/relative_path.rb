require 'jekyll-file-protocol/relative_path_renderer'

module JekyllFileProtocol

  module Jekyll

    module Filters

      def relative_path(url)
        ::JekyllFileProtocol::RelativePathRenderer.new(@context, url).render
      end

    end
  end
end

Liquid::Template.register_filter JekyllFileProtocol::Jekyll::Filters