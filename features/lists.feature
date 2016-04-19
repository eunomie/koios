Feature: Ordered and unordered list formatting

  Lists are a very useful part of Markdown. Ordered and unordered lists are available through `ol` and `ul`.

  Each parameter of those methods are a list item or a nested content (by example a code block in an item).

  Scenario: Basic ordered list
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        ol(['List item 1',
            'List item 2',
            'List item 3'])
      ]}
      """
    Then the markdown output is:
      """

      1. List item 1
      2. List item 2
      3. List item 3

      """

  Scenario: Basic unordered list
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        ul(['List item 1',
            'List item 2',
            'List item 3'])
      ]}
      """
    Then the markdown output is:
      """

      - List item 1
      - List item 2
      - List item 3

      """

  Scenario: Nested ordered lists
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        ol(['List item 1',
            'List item 2',
            ol(['Nested item 1',
                'Nested item 2'])])
      ]}
      """
    Then the markdown output is:
      """

      1. List item 1
      2. List item 2
        1. Nested item 1
        2. Nested item 2

      """

  Scenario: Nested unordered lists
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        ul(['List item 1',
            'List item 2',
            ul(['Nested item 1',
               'Nested item 2'])])
      ]}
      """
    Then the markdown output is:
      """

      - List item 1
      - List item 2
        - Nested item 1
        - Nested item 2

      """
