# This migration comes from storytime (originally 20140813130534)
class AddStorytimeNameToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column Storytime.user_class.table_name.to_sym, :storytime_name, :string
  end
end
