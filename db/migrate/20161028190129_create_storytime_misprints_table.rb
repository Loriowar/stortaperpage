class CreateStorytimeMisprintsTable < ActiveRecord::Migration
  def change
    create_table :storytime_misprints do |t|
      t.text :target_text
      t.text :user_message
      t.text :page_url
      t.datetime :fixed_at

      t.timestamps
    end
  end
end
