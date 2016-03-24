Feature: Block formatting

  Some block formatting are available:

  - code block (with or without mention of language)
  - preformated block

  Scenario: A code block can be defined without a language
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        code('bundle exec cucumber')
      ]}
      """
    Then the markdown output is:
      """

      ```
      bundle exec cucumber
      ```

      """

  Scenario: In a code block, each argument is a new line
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        code('gem install bundler',
             'bundle install koios')
      ]}
      """
    Then the markdown output is:
      """

      ```
      gem install bundler
      bundle install koios
      ```

      """

  Scenario: The language of a code block can be describe using `code_for`
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        code_for('ruby',
                 'Koios::Doc.write {[',
                 ']}')
      ]}
      """
    Then the markdown output is:
      """

      ```ruby
      Koios::Doc.write {[
      ]}
      ```

      """

  Scenario: A string can be converted in a preformatted block
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        'This is a preformatted block'.pre
      ]}
      """
    Then the markdown output is:
      """
          This is a preformatted block

      """

  Scenario: In a preformatted block, each argument is a new line
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        pre('This is a',
            'preformatted',
            'block')
      ]}
      """
    Then the markdown output is:
      """
          This is a
          preformatted
          block

      """

  Scenario: Multiline string are available in code or pre blocks
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        pre('''This is
a
preformatted
block''')
      ]}
      """
    Then the markdown output is:
      """
          This is
          a
          preformatted
          block

      """
    When I execute the following koios code:
      """
      Koios::Doc.write {[
        code('''gem install bundler
gem install koios''')
      ]}
      """
    Then the markdown output is:
      """

      ```
      gem install bundler
      gem install koios
      ```

      """
