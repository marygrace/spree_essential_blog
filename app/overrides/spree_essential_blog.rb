Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_active_shipping_settings_tab",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :partial       => "spree/admin/shared/blog_config")
