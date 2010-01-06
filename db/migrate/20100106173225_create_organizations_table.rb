class CreateOrganizationsTable < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :role
      t.timestamps
    end
  end

end
