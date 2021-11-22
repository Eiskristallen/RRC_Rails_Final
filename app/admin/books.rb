ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :description, :price, :quantity, :author,:image, classifications_attributes:[:id,:dateClassify,:book_id,:category_id,:_destroy]
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
      table_for book.categories.order('name ASC') do
        column do |category|
          category.name
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
      f.has_many :classifications, allow_destroy: true do |n_f|
          n_f.input :category
      end
      # f.input :categories, :as => :select, :multiple => true, :collection => Category.all.map { |kw| ["#{kw.category.capitalize}", kw.id] }
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image):""    
    end
    # f.has_many :classifications do |app_f|
    #   app_f.inputs "Categories" do
    #     if !app_f.object.nil?
    #       # show the destroy checkbox only if it is an existing appointment
    #       # else, there's already dynamic JS to add / remove new appointments
    #       app_f.input :_destroy, :as => :boolean, :label => "Destroy?"
    #     end

    #     app_f.input :category # it should automatically generate a drop-down select to choose from your existing patients
    #   end
    # end 
    f.actions       # adds the 'Submit' and 'Cancel' buttons
  end
  
end
