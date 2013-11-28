module JekyllFileProtocol

  class RelativePathRenderer

    def initialize(context, path)
      @context  = context
      @page_url = @context.registers[:page]['url']
      @path     = path.strip

      generate_relative_path! if is_absolute_path?
    end

    def render
      @relative_path
    end

    protected

      def count_depth(path)
        @page_url.scan('/').size
      end

      def is_absolute_path?
        @path.start_with?('/')
      end

      def generate_relative_path!
        @relative_path = @path
        relative       = @relative_path

        if relative.start_with?('//')
          relative = relative[2..-1]
        else
          relative = relative[1..-1]
        end

        relative       = ("../" * count_depth(@page_url)) + relative
        @relative_path = relative
      end

  end

end