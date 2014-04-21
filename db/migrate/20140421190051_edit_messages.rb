class EditMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contact_id, :integer
  end
end
