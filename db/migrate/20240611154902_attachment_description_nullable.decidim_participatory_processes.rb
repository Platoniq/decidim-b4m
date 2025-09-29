# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20170804125402)
# This file has been modified by `decidim upgrade:migrations` task on 2025-09-12 12:24:10 UTC
class AttachmentDescriptionNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :decidim_attachments, :description, :jsonb, null: true
  end
end
