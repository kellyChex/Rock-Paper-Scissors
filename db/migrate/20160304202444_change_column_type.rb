class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :games, :player2, :string
  end
end
