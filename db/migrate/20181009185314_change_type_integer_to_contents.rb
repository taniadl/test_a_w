class ChangeTypeIntegerToContents < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :type, :string
  end
end
