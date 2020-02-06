# This migration comes from storytime (originally 20150129215308)
class AddSiteIdToStorytimeSubscription < ActiveRecord::Migration[4.2]
  def change
    add_column :storytime_subscriptions, :site_id, :integer
  end
end
