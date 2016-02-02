Feature: Markdown helper
  As a ruby programmer
  I want to easily format string in markdown
  So I can code my libs withour pain

Scenario: Write headers in markdown
  Given a text
  When I want to write a header level 1
  Then I get the header level 1 in markdown

  Given a text
  When I want to write a header level 2
  Then I get the header level 2 in markdown

  Given a text
  When I want to write a header level 3
  Then I get the header level 3 in markdown

  Given a text
  When I want to write a header level 4
  Then I get the header level 4 in markdown

  Given a text
  When I want to write a header level 5
  Then I get the header level 5 in markdown

  Given a text
  When I want to write a header level 6
  Then I get the header level 6 in markdown

