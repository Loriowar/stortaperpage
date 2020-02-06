# This migration comes from storytime (originally 20150216211257)
class AddSubdomainToStorytimeSites < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_sites, :subdomain, :string
  end
end
