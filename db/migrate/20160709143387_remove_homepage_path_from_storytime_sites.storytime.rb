# This migration comes from storytime (originally 20150224212453)
class RemoveHomepagePathFromStorytimeSites < ActiveRecord::Migration[4.2]
  def change
    remove_column :storytime_sites, :homepage_path
  end
end
