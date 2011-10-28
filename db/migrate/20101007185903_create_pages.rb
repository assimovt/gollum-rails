class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :url
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end

    add_index :pages, :parent_id

    # Create parent Welcome page
    Page.create(:name => 'Welcome', :body => 'Getting started guide')

  end

  def self.down
    drop_table :pages
  end
end
