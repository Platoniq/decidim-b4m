# frozen_string_literal: true

require "rails_helper"

describe "Visit the home page", perform_enqueued: true do
  include_context "when visiting organization homepage"

  it "renders the home page" do
    expect(page).to have_content("Home")
  end
end
