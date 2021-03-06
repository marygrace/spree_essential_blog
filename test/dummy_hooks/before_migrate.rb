# Require spree_essential_example and spree_atuh in config/application.rb
gsub_file "config/application.rb", 'require "spree_essential_blog"', %(require "spree_essential_blog"
require "spree")

# Install spree's migrations
rake "spree:install:migrations"

# Mount the Spree::Core routes
insert_into_file File.join('config', 'routes.rb'), :after => "Application.routes.draw do\n" do
  "  # Mount Spree's routes\n  mount Spree::Core::Engine, :at => '/'\n"
end

# Fix uninitialized constant Spree::User::DestroyWithOrdersError 
template "spree_user_error_fix.rb", "config/initializers/spree_user_error_fix.rb"

# remove all stylesheets except core  
%w(admin store).each do |ns|
  template "#{ns}/all.js",  "app/assets/javascripts/#{ns}/all.js",  :force => true
  template "#{ns}/all.css", "app/assets/stylesheets/#{ns}/all.css", :force => true
end

# Fix sass load error by using the converted css file
template "store/screen.css", "app/assets/stylesheets/store/screen.css"

# Install spree essentials & blog
run "bundle exec rails g spree_essentials:install"
run "bundle exec rails g spree_essentials:blog"
