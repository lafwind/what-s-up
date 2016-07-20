ActiveAdmin.register Group do

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

  permit_params :name, :description, :user_id

  menu priority: 4, label: "Groups"

  index do
    column :name do |group|
      link_to group.name, admin_user_path(group)
    end

    column :description

    column :user_id do |group|
      link_to "#{group.user_name}(#{group.user_id})", admin_group_path(group)
    end

    actions
  end

end
