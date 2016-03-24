Feature: Inline text formating

  Formatting text is available using `String` extensions. You can by example write `"my text".italic` to get an italic version of this text.

  Italic is done by surounding the text with `_` and bold version with `**`. Strikethrough is also available.

  Scenario: Italic
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'italic'.italic
      ]}
      """
    Then the markdown output is:
      """
      _italic_

      """

  Scenario: Bold
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'bold'.bold
      ]}
      """
    Then the markdown output is:
      """
      **bold**

      """

  Scenario: Strikethrough
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'strikethrough'.strikethrough
      ]}
      """
    Then the markdown output is:
      """
      ~~strikethrough~~

      """

  Scenario: Code
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'code'.code
      ]}
      """
    Then the markdown output is:
      """
      `code`

      """
