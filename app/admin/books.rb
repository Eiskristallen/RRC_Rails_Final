ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :description, :price, :quantity, :author, :category,:image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price, :quantity, :author]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # 
  index do
    column :title
    column :categories do |book|
      table_for book.categories.order('category ASC') do
        column do |category|
          category.category
        end
       end
    end
    column "Price", sortable: :price do |book|
      number_to_currency book.price
    end
    actions
  end
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    # let's add this piece:
    f.inputs do
      f.input :categories, :as => :select, :multiple => true, :collection => Category.all.map { |kw| ["#{kw.category.capitalize}", kw.id] }
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image):""    
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  
end
