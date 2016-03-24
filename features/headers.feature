Feature: Markdown headers

  Write headers in markdown. Six levels (from `h1` to `h6`) of headers are
  available.

  You can write header in two way, by calling a header function or using
  `String` extension.

  Headers are written using _classical_ style like `# H1` or `### H3`
  instead of underlined versions.

  Scenario: Headers functions
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        h1('H1'),
        h2('H2'),
        h3('H3'),
        h4('H4'),
        h5('H5'),
        h6('H6')
      ]}
      """
    Then the markdown output is:
      """

      # H1

      ## H2

      ### H3

      #### H4

      ##### H5

      ###### H6

      """

  Scenario: Headers join strings
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        h3('This', ' is', ' a', ' h3', ' header')
      ]}
      """
    Then the markdown output is:
      """

      ### This is a h3 header

      """
