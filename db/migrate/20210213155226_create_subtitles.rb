class CreateSubtitles < ActiveRecord::Migration[5.2]
  def change
    create_table :subtitles do |t|
      t.references :release, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.string :file
      t.string :description #説明
      t.string :body
      t.timestamps
    end
  end
end
