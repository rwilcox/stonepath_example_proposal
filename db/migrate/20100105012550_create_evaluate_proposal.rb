class CreateEvaluateProposal < ActiveRecord::Migration
  def self.up
    create_table :evaluate_proposals do |t|
      
      t.string :aasm_state
      t.references :workitem, :polymorphic => true
      t.references :workbench, :polymorphic => true
      
      t.datetime :due_at
      t.datetime :completed_at
      t.timestamps
      
      # customize your task here
    end
  end

  def self.down    
    drop_table :evaluate_proposals
  end
end