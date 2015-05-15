class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.text :description
      t.string :category
      t.string :email

      t.timestamps null: false
    end
  end
end
