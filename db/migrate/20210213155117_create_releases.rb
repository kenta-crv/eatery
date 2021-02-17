class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :file
      t.string :description #説明
      t.string :body
      t.timestamps
    end
  end
end
