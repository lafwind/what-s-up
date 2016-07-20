# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  url            :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  share          :boolean          default(FALSE)
#  group_id       :integer
#  comments_count :integer          default(0)
#  likes_count    :integer          default(0)
#

class Post < ApplicationRecord
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

  validates :description, presence: true, length: {
              maximum: 50,
              too_long: "%{count} characters is the maximum allowed"
            }

  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  scope :recent, -> { where(share: true).order("created_at DESC") }
  scope :active, -> { where("share = ? and comments_count >= ?", true, 3) }
  scope :popular, -> { order(likes_count: :DESC, created_at: :DESC) }

  scope :all_recent, -> (n) { order("created_at DESC").limit(n) }

  scope :liked_by, -> (user) {
    # array to ActiveRecord::Relation
    posts_id = find_each.select { |post| user.voted_for? post }.map(&:id)
    where(id: posts_id)
  }

  self.per_page = 10

  acts_as_votable

  column_name(User)
  column_name(Group)

  # def self.column_name(model)
  #   model_format = model.to_s.downcase
  #   method_name = model_format + '_name'
  #   define_method(method_name) do
  #     column = model_format + '_id'
  #     model.find(self.send(column.to_sym)).name
  #   end
  # end


  # def user_name
  #   User.find(self.user_id).name
  # end

  # def group_name
  #   Group.find(self.group_id).name
  # end
end
