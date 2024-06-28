# frozen_string_literal: true

shared_context "when visiting organization homepage" do
  let(:organization) { create(:organization) }

  before do
    switch_to_host(organization.host)
    visit decidim.root_path
  end
end
