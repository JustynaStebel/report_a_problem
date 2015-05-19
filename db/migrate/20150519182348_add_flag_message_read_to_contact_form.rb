class AddFlagMessageReadToContactForm < ActiveRecord::Migration
  def up
    change_table :contact_forms do |t|
      t.boolean :message_read, default: false
    end
  end

  def down
    remove_column :contact_forms, :message_read
  end
end
