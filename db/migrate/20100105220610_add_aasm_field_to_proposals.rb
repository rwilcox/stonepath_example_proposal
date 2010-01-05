class AddAasmFieldToProposals < ActiveRecord::Migration
  def self.up
    add_column :proposals, :aasm_state, :string
  end

  def self.down
    remove_column :proposals, :aasm_state
  end
end
