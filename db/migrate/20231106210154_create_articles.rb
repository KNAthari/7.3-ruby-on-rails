class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :Categories, null: false, foreign_key: true

      t.timestamps # create two column (created at and updated at)
    end
  end
end
