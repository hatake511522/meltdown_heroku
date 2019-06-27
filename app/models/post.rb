# == Schema Information
#
# Table name: posts
#
#  id        :integer          not null, primary key
#  title     :string(255)      not null
#  user_id   :integer          not null
#  comment   :string(255)
#  url       :text(65535)      not null
#  thumbnail :text(65535)      not null
#

class Post < ApplicationRecord

# 3/30　以下コメントアウトしておかないと投稿できない  
#  belongs_to :user

  validates :title,
            presence: true

  validates :url,
            presence: true

  validates :thumbnail,
            presence: true
end
