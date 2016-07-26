class Blog < ActiveRecord::Base
    validates :title, presence: true    # dive02で追記したよ。
end
