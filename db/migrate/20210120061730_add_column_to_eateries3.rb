class AddColumnToEateries3 < ActiveRecord::Migration[5.2]
  def change
    add_column :eateries, :situation, :string
  end
end
