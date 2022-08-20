class AddTimesstampToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :name , :string
  end
end
