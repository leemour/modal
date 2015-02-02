RSpec::Matchers.define :have_submit_button do |value|
  match do |actual|
    expect(actual).to have_selector("input[type=submit][value='#{value}']")
  end
end

RSpec::Matchers.define :have_upload_field do |value|
  match do |actual|
    expect(page).to have_xpath(
      "//input[@type='file' and contains(@name, '#{value}')]"
    )
  end
end