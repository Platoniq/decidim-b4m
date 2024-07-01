# frozen_string_literal: true

require "rails_helper"

describe "Has Platoniq footer", perform_enqueued: true do
  include_context "when visiting organization homepage"

  it "renders the platoniq logo in the footer" do
    expect(page).to have_content("Made with ♥ by")
    expect(page).to have_xpath("//img[@alt='Platoniq Foundation - Creativity and Democracy']")
  end
end
