class AddMenuTypeToMenuItems < ActiveRecord::Migration
  def change
    add_column :menus, :menu_type, :string

    execute "UPDATE menus SET menu_type = 'header'"

    change_column_null(:menus, :menu_type, false)

    execute <<-SQL
      INSERT INTO menus (title, url, menu_type, created_at, updated_at) VALUES ('Transparency', 'http://nyspeaks.org/organizing-team', 'top_right_header', NOW(), NOW());
      INSERT INTO menus (title, url, menu_type, created_at, updated_at) VALUES ('Open data', 'http://data.nyspeaks.org', 'top_right_header', NOW(), NOW());
    SQL
  end
end
