class AddDescriptionToDecidimSuperspaces < ActiveRecord::Migration[6.1]
  def change
    add_column :decidim_superspaces_superspaces, :description, :jsonb
  end
end
