# This migration comes from storytime (originally 20150206201919)
class AddSiteIdToStorytimeSnippet < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_snippets, :site_id, :integer

    Storytime::Migrators::V1.add_site_id_to_snippets
  end
end
