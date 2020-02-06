# This migration comes from storytime (originally 20150225143516)
class AddSiteIdToStorytimeAutosaves < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_autosaves, :site_id, :integer
    add_index :storytime_autosaves, :site_id
  end
end
