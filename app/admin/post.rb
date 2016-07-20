ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu priority: 3, label: "Posts"

  permit_params :title, :url, :description, :share, :user_id, :group_id

  scope :active
  scope :popular

  index do
    column :title do |post|
      link_to post.title, admin_post_path(post)
    end
    column :url
    column :description
    column :share
    column :user_id do |post|
      link_to "#{post.user_name}(#{post.user_id})", admin_user_path(post.user_id)
    end

    column :group_id do |post|
      link_to "#{post.group_name}(#{post.group_id})", admin_user_path(post.group_id)
    end

    actions
  end
end
