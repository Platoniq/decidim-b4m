# frozen_string_literal: true

require "rails_helper"

describe "Has EU footer", perform_enqueued: true do
  include_context "when visiting organization homepage"

  it "renders the eu flag in the footer" do
    expect(page).to have_xpath("//img[@alt='European Union flag: Funded by the European Union']")
  end
end
