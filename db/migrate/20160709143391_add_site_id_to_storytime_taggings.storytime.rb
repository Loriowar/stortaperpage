# This migration comes from storytime (originally 20150225145316)
class AddSiteIdToStorytimeTaggings < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_taggings, :site_id, :integer
    add_index :storytime_taggings, :site_id
  end
end
