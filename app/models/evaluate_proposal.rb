
# EvaluateProposal represents a Proposal getting passed from Agent to agent,
# where the reciever will either accept or reject the pointed at proposal
class EvaluateProposal < ActiveRecord::Base
  include StonePath
  
  stonepath_task
  
  #logs_transitions
  
end