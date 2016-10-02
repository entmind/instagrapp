class RenameBlogsToPictures < ActiveRecord::Migration
  # テーブルを変更したよ。dive14exam
  def change
    rename_table :blogs, :pictures
  end
end
