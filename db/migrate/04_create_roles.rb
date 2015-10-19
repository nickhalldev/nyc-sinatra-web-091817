class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :title_id 
      t.integer :figure_id
    end
  end
end