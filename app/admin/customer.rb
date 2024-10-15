ActiveAdmin.register Customer do
  # Allow Ransack search
  filter :full_name
  filter :phone_number
  filter :email
  filter :notes
  filter :created_at
  filter :updated_at

  permit_params :full_name, :phone_number, :email, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column :image do |customer|
      if customer.image.attached?
        image_tag customer.image.variant(resize_to_limit: [80, 80]).processed
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag customer.image.variant(resize_to_limit: [200, 200]) 
        end
      end 
    end
    active_admin_comments
  end
end
