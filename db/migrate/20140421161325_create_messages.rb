class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :from
      t.string :to
      t.timestamps
    end
  end
end
