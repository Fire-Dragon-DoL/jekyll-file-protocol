module JekyllFileProtocol
  module Jekyll
    module Filters

      def relative_path(path)
        require 'pry'
        binding.pry
        "ciao"
      end

    end
  end
end

Liquid::Template.register_filter JekyllFileProtocol::Jekyll::Filters