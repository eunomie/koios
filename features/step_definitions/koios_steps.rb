Given(/^a text$/) do
  @content = 'A nice text'
end

When(/^I want to write a header level 1$/) do
  @md = Koios::Md.h1 @content
end

When(/^I want to write a header level 2$/) do
  @md = Koios::Md.h2 @content
end

When(/^I want to write a header level 3$/) do
  @md = Koios::Md.h3 @content
end

When(/^I want to write a header level 4$/) do
  @md = Koios::Md.h4 @content
end

When(/^I want to write a header level 5$/) do
  @md = Koios::Md.h5 @content
end

When(/^I want to write a header level 6$/) do
  @md = Koios::Md.h6 @content
end

Then(/^I get the header level (\d) in markdown$/) do |level|
  expect(@md).to eq("#{'#' * level.to_i} #{@content}")
end
