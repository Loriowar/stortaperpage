# This migration comes from storytime (originally 20150224193551)
class AddLayoutToStorytimeSites < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_sites, :layout, :string
  end
end
