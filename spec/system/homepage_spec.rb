# frozen_string_literal: true

require "rails_helper"

describe "Visit the home page", perform_enqueued: true do
  let(:organization) { create(:organization) }

  before do
    switch_to_host(organization.host)
    visit decidim.root_path
  end

  it "renders the home page" do
    expect(page).to have_content("Home")
  end
end
