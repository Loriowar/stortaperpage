# This migration comes from storytime (originally 20150224194559)
class AddDisqusForumShortnameToStorytimeSites < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_sites, :disqus_forum_shortname, :string
  end
end
