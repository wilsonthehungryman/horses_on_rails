ActiveAdmin.register Horse do
  permit_params do
    permitted = [ :name, :breed_id, :age, :number_of_legs, :top_speed ]
    permitted << :other if params[:action] == "create" && current_user.admin?
    permitted
  end
end
