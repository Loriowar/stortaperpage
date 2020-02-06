# This migration comes from storytime (originally 20150225145119)
class AddSiteIdToStorytimeVersions < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_versions, :site_id, :integer
    add_index :storytime_versions, :site_id
  end
end