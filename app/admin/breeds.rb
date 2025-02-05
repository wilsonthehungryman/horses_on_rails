ActiveAdmin.register Breed do
  permit_params do
    permitted = [ :name ]
    permitted << :other if params[:action] == "create" && current_user.admin?
    permitted
  end
end
