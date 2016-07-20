# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true, length: { minimum: 6, maximum: 50 }

  belongs_to :user
  has_many :posts

  column_name(User)
end
