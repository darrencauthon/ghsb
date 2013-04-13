# RailsAdmin config file. Generated on March 09, 2013 16:52
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  config.attr_accessible_role { :admin }
  config.authorize_with       { redirect_to '/' unless warden.user.try(:admin?) }
  config.current_user_method  { current_user }

  config.main_app_name = ['Github StatusBoard', 'Admin']
end
