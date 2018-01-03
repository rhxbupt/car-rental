class AddNocToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :noc, :integer,default: 0
  end
end
