module Koios
  class Doc
    def self.write(&content)
      instance = self.new

      instance.extend_string
      String.koios_md_content = instance.content

      instance.instance_eval(&content)

      instance.unextend_string

      instance.to_s
    end

    attr_accessor :content

    def initialize
      @content = []
    end

    def to_s
      @content.join
    end

    def extend_string
      String.class_eval do
        class << self
          def koios_md_content=(content)
            @@koios_md_content = content
          end
        end

        def h1
          @@koios_md_content << h(self.to_s, 1)
        end

        def h2
          @@koios_md_content << h(self.to_s, 2)
        end

        def h3
          @@koios_md_content << h(self.to_s, 3)
        end

        def h4
          @@koios_md_content << h(self.to_s, 4)
        end

        def h5
          @@koios_md_content << h(self.to_s, 5)
        end

        def h6
          @@koios_md_content << h(self.to_s, 6)
        end

        private
        def h(content, level)
          "\n#{"#" * level} #{content}\n"
        end
      end
    end

    def unextend_string
      String.class_eval do
        remove_method :h1

        class << self
          remove_method :koios_md_content=
        end
      end
    end
  end
end
