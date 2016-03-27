Feature: Link

  Write links in markdown, with or without a content. If not, the url is duplicated as content.

  You can create a link by extending a string like:

      'https://github.com'.link_to 'Github'

  Or by calling the `a` function:

      a 'https://github.com', 'Github'

  Scenario: Extend string to create link only with url
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'https://github.com'.link_to
      ]}
      """
    Then the markdown output is:
      """
      [https://github.com](https://github.com)

      """

  Scenario: Extend string to create link with url and content
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'https://github.com'.link_to('Github')
      ]}
      """
    Then the markdown output is:
      """
      [Github](https://github.com)

      """

  Scenario: Function to create link only with url
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        a('https://github.com')
      ]}
      """
    Then the markdown output is:
      """
      [https://github.com](https://github.com)

      """

  Scenario: Function to create link with url and content
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        a('https://github.com', 'Github')
      ]}
      """
    Then the markdown output is:
      """
      [Github](https://github.com)

      """

