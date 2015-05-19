class AddPriceAndEctToContactForm < ActiveRecord::Migration
  def change
    add_column :contact_forms, :price, :integer
    add_column :contact_forms, :ect, :datetime
  end
end
