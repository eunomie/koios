When(/^I execute the following koios code:$/) do |ruby|
  @md = eval ruby
end

Then(/^the markdown output is:$/) do |expected_markdown|
  expect(@md).to eq expected_markdown
end
