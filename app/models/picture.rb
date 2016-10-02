class Picture < ActiveRecord::Base
    validates :title, :pic, presence: true    # dive02で追記したよ。
    belongs_to :user
    mount_uploader :pic, PicUploader
end
