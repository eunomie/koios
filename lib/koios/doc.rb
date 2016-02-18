module Koios
  class Doc
    def self.write(&content)
      instance = self.new

      instance.extend_string
      String.koios = instance

      instance.content = instance.instance_eval(&content)

      instance.unextend_string

      instance.to_s
    end

    def to_s
      @content.join("\n") + "\n"
    end

    def p(*args)
      "\n" + args.join('')
    end

    def h1(*args)
      args.join('').h1
    end

    def h2(*args)
      args.join('').h2
    end

    def h3(*args)
      args.join('').h3
    end

    def h4(*args)
      args.join('').h4
    end

    def h5(*args)
      args.join('').h5
    end

    def h6(*args)
      args.join('').h6
    end

    def a(url, content = nil)
      c = content || url
      url.link_to c
    end

    def initialize
      @content = []
    end

    def extend_string
      String.class_eval do
        class << self
          def koios=(koios)
            @@koios = koios
          end
        end

        def h1
          h(self, 1)
        end

        def h2
          h(self, 2)
        end

        def h3
          h(self, 3)
        end

        def h4
          h(self, 4)
        end

        def h5
          h(self, 5)
        end

        def h6
          h(self, 6)
        end

        def break_line
          self + "  \n"
        end

        def link_to(content = nil)
          c = content || self
          "[#{c}](#{self})"
        end

        private
        def h(content, level)
          "\n#{"#" * level} #{content}"
        end
      end
    end

    def unextend_string
      String.class_eval do
        remove_method :h1
        remove_method :h2
        remove_method :h3
        remove_method :h4
        remove_method :h5
        remove_method :h6
        remove_method :break_line
        remove_method :link_to

        class << self
          remove_method :koios=
        end
      end
    end

    def content=(arr)
      @content = arr
    end
  end
end
