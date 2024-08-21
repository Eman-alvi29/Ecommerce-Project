ActiveAdmin.register Item do
  permit_params :name, :description, :price, :category_id, :image, size_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    column :sizes do |item|
      item.sizes.map(&:name).join(', ')
    end
    column :image do |item|
      if item.image.attached?
        image_tag url_for(item.image), size: "50x50"
      end
    end
    actions
  end

  filter :name
  filter :description
  filter :price
  filter :category
  filter :sizes, as: :select, collection: -> { Size.all.map { |s| [s.name, s.id] } }

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category
      f.input :sizes, as: :check_boxes, collection: Size.all.map { |s| [s.name, s.id] }
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :category
      row :sizes do |item|
        item.sizes.map(&:name).join(', ')
      end
      row :image do |item|
        if item.image.attached?
          image_tag url_for(item.image), size: "50x50"
        end
      end
    end
  end
end
