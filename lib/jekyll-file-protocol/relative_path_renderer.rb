module JekyllFileProtocol

  class RelativePathRenderer

    def initialize(context, path)
      @context  = context
      @page_url = @context.registers[:page]['url']
      @path     = path.strip

      generate_relative_path!
    end

    def render
      @relative_path
    end

    protected

      def count_depth(path)
        clear_leading_slashes(@page_url).scan('/').size
      end

      def is_absolute_path?
        @path.start_with?('/')
      end

      def generate_relative_path!
        @relative_path = @path
        relative       = @relative_path
        
        return unless is_absolute_path?

        relative       = clear_leading_slashes(relative)

        relative       = ("../" * count_depth(@page_url)) + relative
        @relative_path = relative
      end

    private

      def clear_leading_slashes(path)
        return path unless path.start_with?('/')
        real_path = path

        if real_path.start_with?('//')
          real_path = real_path[2..-1]
        else
          real_path = real_path[1..-1]
        end
      end

  end

end