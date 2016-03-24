Given(/^the following koios code:$/) do |ruby|
  @ruby = ruby
end

When(/^I execute the koios code$/) do
  @md = eval @ruby
end

Then(/^the markdown output is:$/) do |expected_markdown|
  expect(@md).to eq expected_markdown
end
