require 'jekyll-file-protocol/relative_path_renderer'

module JekyllFileProtocol

  module Jekyll

    module Filters

      def relative_path(input)
        require 'pry'; binding.pry
        return input if input.nil?
        ::JekyllFileProtocol::RelativePathRenderer.new(@context, input).render
      end

    end
  end
end

Liquid::Template.register_filter JekyllFileProtocol::Jekyll::Filters