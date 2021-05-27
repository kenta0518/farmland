class ChangeIsBooleanDefaultOnNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_default :notifications, :checked, from: nil, to: false
  end
end
