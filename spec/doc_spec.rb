require 'koios'


RSpec::Expectations.configuration.warn_about_potential_false_positives = false

describe Koios::Doc do
  context '#to_s' do
    it 'join all elements and add a new line' do
      lines = [
               'line 1',
               'line 2',
               'line 3'
              ]
      md = Koios::Doc.write {
        lines
      }
      exp = lines.join("\n") + "\n"
      expect(md).to eq exp
    end
  end

  context '##write' do
    it 'extends String inside' do
      header_content = "header"
      md_header = "\n# #{header_content}\n"
      str = Koios::Doc.write {[
        header_content.h1
      ]}
      expect(str).to eq md_header
    end

    it 'does not extend String outside - h1' do
      Koios::Doc.write {[
        "plop".h1
      ]}
      expect{"plop".h1}.to raise_error
    end

    it 'does not extend String outside - h2' do
      Koios::Doc.write {[
        "plop".h2
      ]}
      expect{"plop".h2}.to raise_error
    end

    it 'does not extend String outside - h3' do
      Koios::Doc.write {[
        "plop".h3
      ]}
      expect{"plop".h3}.to raise_error
    end

    it 'does not extend String outside - h4' do
      Koios::Doc.write {[
        "plop".h4
      ]}
      expect{"plop".h4}.to raise_error
    end

    it 'does not extend String outside - h5' do
      Koios::Doc.write {[
        "plop".h5
      ]}
      expect{"plop".h5}.to raise_error
    end

    it 'does not extend String outside - h6' do
      Koios::Doc.write {[
        "plop".h6
      ]}
      expect{"plop".h6}.to raise_error
    end

    it 'does not extend String outside - break line' do
      Koios::Doc.write {[
        "plop".break_line
      ]}
      expect{"plop".break_line}.to raise_error
    end

    it 'does not extend String outside - link_to' do
      Koios::Doc.write {[
        "plop".link_to
      ]}
      expect{"plop".link_to}.to raise_error
    end

    it 'does not extend String outside - img' do
      Koios::Doc.write {[
        "plop".img
      ]}
      expect{"plop".img}.to raise_error
    end

    it 'does not extend String outside - italic' do
      Koios::Doc.write {[
        "plop".italic
      ]}
      expect{"plop".italic}.to raise_error
    end

    it 'does not extend String outside - bold' do
      Koios::Doc.write {[
        "plop".bold
      ]}
      expect{"plop".bold}.to raise_error
    end

    it 'does not extend String outside - strikethrough' do
      Koios::Doc.write {[
        "plop".strikethrough
      ]}
      expect{"plop".strikrthrough}.to raise_error
    end

    it 'does not extend String outside - code' do
      Koios::Doc.write {[
        "plop".code
      ]}
      expect{"plop".code}.to raise_error
    end

    it 'does not extend String outside - pre' do
      Koios::Doc.write {[
        "plop".pre
      ]}
      expect{"plop".pre}.to raise_error
    end


    it 'generate a document with 6 levels of headers using string extension' do
      md = Koios::Doc.write {[
        "header level 1".h1,
        "header level 2".h2,
        "header level 3".h3,
        "header level 4".h4,
        "header level 5".h5,
        "header level 6".h6
      ]}
      exp = <<-EOF

# header level 1

## header level 2

### header level 3

#### header level 4

##### header level 5

###### header level 6
EOF

      expect(md).to eq exp
    end

    it 'generate a document with 6 levels of headers' do
      md = Koios::Doc.write {[
        h1("header level 1"),
        h2("header level 2"),
        h3("header level 3"),
        h4("header level 4"),
        h5("header level 5"),
        h6("header level 6")
      ]}
      exp = <<-EOF

# header level 1

## header level 2

### header level 3

#### header level 4

##### header level 5

###### header level 6
EOF

      expect(md).to eq exp
    end

    it 'generate joined headers' do
      md = Koios::Doc.write {[
        h1("header", " level 1"),
        h2("header", " level 2"),
        h3("header", " level", " 3"),
        h4("header", " level 4"),
        h5("header", " level ", "5"),
        h6("header", " level 6")
      ]}
      exp = <<-EOF

# header level 1

## header level 2

### header level 3

#### header level 4

##### header level 5

###### header level 6
EOF

      expect(md).to eq exp
    end

    it 'generates a document with paragraphs' do
      md = Koios::Doc.write {[
        p("This is a paragraph."),

        p("This is an other paragraph.")
      ]}
      exp = <<EOF

This is a paragraph.

This is an other paragraph.
EOF

      expect(md).to eq exp
    end

    it 'generates a document with multilines paragraph' do
      md = Koios::Doc.write {[
        p("This is a paragraph\nwith\nmulti\nline content")
      ]}
      exp = <<EOF

This is a paragraph
with
multi
line content
EOF
      expect(md).to eq exp
    end

    it 'generates a document with paragraph in multi arguments' do
      md = Koios::Doc.write {[
        p("This is a ", "paragraph ", "with multi\nline ", "and multi ", "arguments.")
      ]}
      exp = <<EOF

This is a paragraph with multi
line and multi arguments.
EOF
      expect(md).to eq exp
    end

    it 'generates paragraphs with break line' do
      md = Koios::Doc.write {[
        p("This is a".break_line, "break line")
      ]}
      exp = <<EOF

This is a  
break line
EOF
      expect(md).to eq exp
    end

    it 'allows to enter a header in a paragraph (but why?)' do
      md = Koios::Doc.write {[
        p("This is a header".h1)
      ]}
      exp = <<EOF


# This is a header
EOF
      expect(md).to eq exp
    end

    it 'expands link with only the url from string' do
      url = "http://github.com/eunomie"
      md = Koios::Doc.write {[
        url.link_to
      ]}
      exp = "[#{url}](#{url})\n"
      expect(md).to eq exp
    end

    it 'expands link with only the url' do
      url = "http://github.com/eunomie"
      md = Koios::Doc.write {[
        a(url)
      ]}
      exp = "[#{url}](#{url})\n"
      expect(md).to eq exp
    end

    it 'expands link from string' do
      url = "http://github.com/eunomie"
      txt = "github"
      md = Koios::Doc.write {[
        url.link_to(txt)
      ]}
      exp = "[#{txt}](#{url})\n"
      expect(md).to eq exp
    end

    it 'expands link' do
      url = "http://github.com/eunomie"
      txt = "github"
      md = Koios::Doc.write {[
        a(url, txt)
      ]}
      exp = "[#{txt}](#{url})\n"
      expect(md).to eq exp
    end

    it 'expands img from string' do
      img = 'https://travis-ci.org/eunomie/koios.svg?branch=master'
      md = Koios::Doc.write {
        [
         img.img
        ]}
      exp = "![](#{img})\n"
      expect(md).to eq exp
    end

    it 'expands img from string with alt' do
      img = 'https://travis-ci.org/eunomie/koios.svg?branch=master'
      alt = 'koios'
      md = Koios::Doc.write {
        [
         img.img(alt)
        ]}
      exp = "![#{alt}](#{img})\n"
      expect(md).to eq exp
    end

    it 'expands img' do
      img = 'https://travis-ci.org/eunomie/koios.svg?branch=master'
      md = Koios::Doc.write {
        [
         img(img)
        ]}
      exp = "![](#{img})\n"
      expect(md).to eq exp
    end

    it 'expands img with alt' do
      img = 'https://travis-ci.org/eunomie/koios.svg?branch=master'
      alt = 'koios'
      md = Koios::Doc.write {
        [
         img(img, alt)
        ]}
      exp = "![#{alt}](#{img})\n"
      expect(md).to eq exp
    end

    it 'allows to mix link and img' do
      url = 'https://travis-ci.org/eunomie/koios'
      image = 'https://travis-ci.org/eunomie/koios.svg?branch=master'
      alt = 'Build status'
      md = Koios::Doc.write {
        [url.link_to(image.img(alt))]
      }
      exp = "[![#{alt}](#{image})](#{url})\n"
      expect(md).to eq exp
    end

    it 'allows to write italic' do
      content = "plop"
      md = Koios::Doc.write {
        [content.italic]
      }
      exp = "_#{content}_\n"
      expect(md).to eq exp
    end

    it 'allows to write bold' do
      content = "plop"
      md = Koios::Doc.write {
        [content.bold]
      }
      exp = "**#{content}**\n"
      expect(md).to eq exp
    end

    it 'allows to write strikethrough' do
      content = "plop"
      md = Koios::Doc.write {
        [content.strikethrough]
      }
      exp = "~~#{content}~~\n"
      expect(md).to eq exp
    end

    it 'allows to write inline code' do
      content = "plop"
      md = Koios::Doc.write {
        [content.code]
      }
      exp = "`#{content}`\n"
      expect(md).to eq exp
    end

    it 'allows to write code block' do
      md = Koios::Doc.write {
        [code("gem install bundler",
              "bundle install koios")]
      }
      exp = <<EOF

```
gem install bundler
bundle install koios
```
EOF
      expect(md).to eq exp
    end

    it 'allows to write code block for a defined language' do
      md = Koios::Doc.write {
        [code_for("sh",
                  "gem install bundler",
                  "bundle install koios")]
      }
      exp = <<EOF

```sh
gem install bundler
bundle install koios
```
EOF
      expect(md).to eq exp
    end

    it 'allow to write unordered list' do
      md = Koios::Doc.write {
        [ul(["First line",
             "Second line"])]
      }
      exp = <<EOF

- First line
- Second line
EOF
      expect(md).to eq exp
    end

    it 'allow to write nested list' do
      md = Koios::Doc.write {
        [ul(["First line",
             "Second line",
             ul(["First nested",
                 "Second nested"]),
             "Return to first ul",
             ul(["With nested",
                 ul(["And nested...",
                     "... in nested"])])])]
      }
      exp = <<EOF

- First line
- Second line
  - First nested
  - Second nested
- Return to first ul
  - With nested
    - And nested...
    - ... in nested
EOF
      expect(md).to eq exp
    end

    it 'allow to nest what you want in a list' do
      md = Koios::Doc.write {
        [ul(["First line",
             "Second line",
             pre("First pre line",
                 "Second pre line"),
             p("And a paragraph"),
             code("And some code")])]
      }
      exp = <<EOF

- First line
- Second line

      First pre line
      Second pre line

  And a paragraph

  ```
  And some code
  ```
EOF
    end

    it 'allow to write ordered list' do
      md = Koios::Doc.write {
        [ol(["First line",
             "Second line"])]
      }
      exp = <<EOF

1. First line
2. Second line
EOF
      expect(md).to eq exp
    end

    it 'allow to write nested ordered list' do
      md = Koios::Doc.write {
        [ol(["First line",
             "Second line",
             ol(["First nested",
                 "Second nested"]),
             "Return to first ol",
             ol(["With nested",
                 ol(["And nested...",
                     "... in nested"])])])]
      }
      exp = <<EOF

1. First line
2. Second line
  1. First nested
  2. Second nested
3. Return to first ol
  1. With nested
    1. And nested...
    2. ... in nested
EOF
      expect(md).to eq exp
    end

    it 'allow to nest what you want in an ordered list' do
      md = Koios::Doc.write {
        [ol(["First line",
             "Second line",
             pre("First pre line",
                 "Second pre line"),
             p("And a paragraph"),
             code("And some code")])]
      }
      exp = <<EOF

1. First line
2. Second line

      First pre line
      Second pre line

  And a paragraph

  ```
  And some code
  ```
EOF
    end

    it 'allow to write preformated block' do
      md = Koios::Doc.write {
        [pre(["first line",
              "second line"])]
      }
      exp = <<EOF
    first line
    second line
EOF
      expect(md).to eq exp
    end

    it 'allow to write preformated block from string' do
      md = Koios::Doc.write {
        ["first line\nsecond line".pre]
      }
      exp = <<EOF
    first line
    second line
EOF
      expect(md).to eq exp
    end

    it 'handle a full markdown file' do
      exp = <<EOF

# Koios: write markdown in ruby without pain

[![Build Status](https://travis-ci.org/eunomie/koios.svg?branch=master)](https://travis-ci.org/eunomie/koios) [![Gem Version](https://badge.fury.io/rb/koios.svg)](https://badge.fury.io/rb/koios)

## Installation

### Prerequisites

- Ruby >= 2.2

### Setup

```
gem install koios
```

## Usage

## Contributing

1. [Fork it](https://github.com/eunomie/koios/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes, with tests (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new _Pull Request_

## LICENSE

Please see [LICENSE](https://github.com/eunomie/koios/blob/master/LICENSE).

## AUTHOR

Yves Brissaud, [@\_crev_](https://twitter.com/_crev_), [@eunomie](https://github.com/eunomie)
EOF

      md = Koios::Doc.write {
        ["Koios: write markdown in ruby without pain".h1,
         p("https://travis-ci.org/eunomie/koios".link_to("https://travis-ci.org/eunomie/koios.svg?branch=master".img("Build Status")),
           " ",
           "https://badge.fury.io/rb/koios".link_to("https://badge.fury.io/rb/koios.svg".img("Gem Version"))),
         "Installation".h2,
         "Prerequisites".h3,
         ul(["Ruby >= 2.2"]),
         "Setup".h3,
         code("gem install koios"),
         "Usage".h2,
         "Contributing".h2,
         ol(["https://github.com/eunomie/koios/fork".link_to("Fork it"),
             "Create your feature branch (" + "git checkout -b my-new-feature".code + ")",
             "Commit your changes, with tests (" + "git commit -am 'Add some feature'".code + ")",
             "Push to the branch (" + "git push origin my-new-feature".code + ")",
             "Create a new " + "Pull Request".italic]),
         "LICENSE".h2,
         p("Please see ", "https://github.com/eunomie/koios/blob/master/LICENSE".link_to("LICENSE"), "."),
         "AUTHOR".h2,
         p("Yves Brissaud, ", "https://twitter.com/_crev_".link_to("@_crev_"), ", ", "https://github.com/eunomie".link_to("@eunomie"))
        ]
      }

      expect(md).to eq exp
    end
  end
end
