module Koios
  class Md
    class << self
      # Markdown title 1
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h1(title)
        "# #{title}"
      end

      # Markdown title 2
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h2(title)
        "## #{title}"
      end

      # Markdown title 3
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h3(title)
        "### #{title}"
      end

      # Markdown title 4
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h4(title)
        "#### #{title}"
      end

      # Markdown title 5
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h5(title)
        "##### #{title}"
      end

      # Markdown title 6
      # @param [String] title Content of the title
      # @return [String] Markdown title
      def h6(title)
        "###### #{title}"
      end
    end
  end
end
