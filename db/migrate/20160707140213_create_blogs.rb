class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title  # dive01で追記したよ。
      t.text :content  # dive01で追記したよ。

      t.timestamps null: false
    end
  end
end
