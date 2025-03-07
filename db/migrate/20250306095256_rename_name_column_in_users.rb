class RenameNameColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Name, :name
  end
end
