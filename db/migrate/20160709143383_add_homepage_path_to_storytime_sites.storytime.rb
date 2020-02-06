# This migration comes from storytime (originally 20150224192138)
class AddHomepagePathToStorytimeSites < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_sites, :homepage_path, :string
  end
end
