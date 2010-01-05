
# EvaluateProposal represents a Proposal getting passed from Agent to agent,
# where the reciever will either accept or reject the pointed at proposal
class EvaluateProposal < ActiveRecord::Base
  include StonePath
  # This include gives us the following methods in this class now
  # * a belongs_to :workbench (polymorphic)
  # * a belongs_to :workitem (polymorphic)
  # AASM events for #complete, #cancel, #expire
  # named scopes for unassigned, assigned, active, completed, cancelled, and overdue

  stonepath_task

  #logs_transitions
  
end