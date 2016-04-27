class AddIntroductionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :string
    add_column :users, :area, :string
    add_column :users, :homepage, :string
    add_column :users, :birthday, :string
  end
end
