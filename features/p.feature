Feature: Paragraph

  Write paragrphs in markdown. All arguments of the function `p` are concatenated without spacing.

  If you want to add a line break, call `break_line` on a string.

  A paragraph starts and ends with a new line.

  Scenario: Write a paragraph with one line
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        p('This is a paragraph.')
      ]}
      """
    Then the markdown output is:
      """

      This is a paragraph.

      """

  Scenario: Arguments are concatenated
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        p('This is a paragraph ', 'written ', 'in multiple ', 'lines.')
      ]}
      """
    Then the markdown output is:
      """

      This is a paragraph written in multiple lines.

      """

  Scenario: Insert line break in a paragraph
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        p('This is a paragraph'.break_line, 'with a line break: two spaces at the end of the line.')
      ]}
      """
    Then the markdown output is:
      """

      This is a paragraph  
      with a line break: two spaces at the end of the line.

      """

  Scenario: Concatenation allows to insert every content you want
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        p('This ', 'is'.bold, ' a ', 'styled'.italic, ' markdown text using ',
          'https://github.com/eunomie/koios'.link_to('Koios'))
      ]}
      """
    Then the markdown output is:
      """

      This **is** a _styled_ markdown text using [Koios](https://github.com/eunomie/koios)

      """
