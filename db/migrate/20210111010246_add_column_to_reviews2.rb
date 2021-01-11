class AddColumnToReviews2 < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :select, :string
  end
end
