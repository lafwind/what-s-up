ActiveAdmin.register Comment, as: "UserComment" do

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


  permit_params :content, :user_id, :post_id

  menu priority: 5, label: "User Comments"

  index do
    column :user_id do |comment|
      link_to "#{comment.user_name}(#{comment.user_id})", admin_comment_path(comment)
    end

    column :post_id do |comment|
      link_to "#{comment.post_name}(#{comment.post_id})", admin_comment_path(comment)
    end

    column :content

    actions
  end

end
