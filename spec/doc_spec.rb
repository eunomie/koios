require 'koios'

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

    it 'does not extend String outside' do
      Koios::Doc.write {[
        "plop".h1
      ]}
      expect{"plop".h1}.to raise_error
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
  end
end
