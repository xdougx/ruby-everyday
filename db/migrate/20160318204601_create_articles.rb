class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :subject
      t.text :introduction
      t.text :body
      t.string :permalink
      t.string :status
      t.string :cover
      t.string :published_in

      t.timestamps null: false
    end
  end
end
