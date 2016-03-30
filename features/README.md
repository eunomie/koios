Koios is a little ruby gem to write markdown.

## Example

```ruby
Koios::Doc.write{[
  "Koios: write markdown in ruby without pain".h1,
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
]}
```

Will produce the following markdown output:

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
