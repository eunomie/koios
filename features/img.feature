Feature: Image

  Write images in markdown. An alternative message can be added to the picture.

  You can create an image by extending a string like:

      'https://travis-ci.org/eunomie/koios.svg?branch=master'.img 'Build status'

  Or by calling the `img` function:

      img 'https://travis-ci.org/eunomie/koios.svg?branch=master', 'Build status'

  Scenario: Extend string to create image
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'https://travis-ci.org/eunomie/koios.svg?branch=master'.img
      ]}
      """
    Then the markdown output is:
      """
      ![](https://travis-ci.org/eunomie/koios.svg?branch=master)

      """

  Scenario: Extend string to create image with alt content
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'https://travis-ci.org/eunomie/koios.svg?branch=master'.img('Build status')
      ]}
      """
    Then the markdown output is:
      """
      ![Build status](https://travis-ci.org/eunomie/koios.svg?branch=master)

      """

  Scenario: Function to create image
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        img('https://travis-ci.org/eunomie/koios.svg?branch=master')
      ]}
      """
    Then the markdown output is:
      """
      ![](https://travis-ci.org/eunomie/koios.svg?branch=master)

      """

  Scenario: Function to create image with alt content
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        img('https://travis-ci.org/eunomie/koios.svg?branch=master', 'Build status')
      ]}
      """
    Then the markdown output is:
      """
      ![Build status](https://travis-ci.org/eunomie/koios.svg?branch=master)

      """
