class Contact < ActiveRecord::Base
    validates :name, :email, :content, presence: true    # dive02課題で追記したよ。
end
