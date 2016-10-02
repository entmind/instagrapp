class Picture < ActiveRecord::Base
    validates :title, presence: true    # dive02で追記したよ。
    belongs_to :user
end
