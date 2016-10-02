class AddPicToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pic, :string
  end
end
