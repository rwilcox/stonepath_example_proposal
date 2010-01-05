class CreateProposalsTable < ActiveRecord::Migration
  def self.up
    create_table :proposals, :force => true do |t|
      t.integer :owner
      t.text :title
      t.timestamps
    end
  end

  def self.down
    drop_table :proposals
  end
end
