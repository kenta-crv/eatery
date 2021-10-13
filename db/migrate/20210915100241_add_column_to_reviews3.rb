class AddColumnToReviews3 < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :total_score, :integer
  end
end
