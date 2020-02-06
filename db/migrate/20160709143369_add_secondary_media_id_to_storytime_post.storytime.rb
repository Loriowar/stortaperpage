# This migration comes from storytime (originally 20141020213343)
class AddSecondaryMediaIdToStorytimePost < ActiveRecord::Migration[4.2]
  def change
    add_reference :storytime_posts, :secondary_media
  end
end
