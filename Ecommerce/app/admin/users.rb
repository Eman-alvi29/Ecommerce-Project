ActiveAdmin.register User do

  # Index page
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  # Show page
  show do
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end
  end

  # Form for creating and editing users
  form do |f|
    f.inputs do
      f.input :email
      # If you want to include other fields, add them here
      # f.input :first_name
      # f.input :last_name
      # If you're handling password manually, include it like this:
      # f.input :password
      # f.input :password_confirmation
    end
    f.actions
  end

  # Permit parameters for mass assignment
  permit_params :email, :password, :password_confirmation

  # Optional: custom filters for search
  filter :email
  filter :created_at

end
