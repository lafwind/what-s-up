# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  share       :boolean          default(FALSE)
#  group_id    :integer
#

class Post < ActiveRecord::Base
  URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/

  validates :title, presence: true, length: {
              minimum: 5, maximum: 30,
              too_long: "%{count} characters is the maximum allowed",
              too_short: "%{count} characters is the minimum allowed"
            }

  validates :url, presence: true, format: {
              with: URL_REGEX,
              message: "Invalid URL format!"
            }

  validates :description, length: {
              maximum: 50,
              too_long: "%{count} characters is the maximum allowed"
            }

  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  acts_as_votable
end
