class EditContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :name, :phone
    add_column :contacts, :user_id, :integer
    add_column :contacts, :receiver_id, :integer
  end
end
