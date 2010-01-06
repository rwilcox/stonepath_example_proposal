# In StonePath, every work item has an owner. An owner can be responsible for a work item and/or a work bench.
# In this example a User is only responsible for a work bench.
#
# If you do have an entity that is both a work owner and has work benches, you need to add the following
# to your class declaration:
#   include StonePath     # because this is a Work Owner it needs this here, so we have all the stonepath provided stuff
#   stonepath_workowner   # need to tell StonePath this is a work owner
#
# The specifications for our domain (Proposal, Administrators and Organizations) a proposal is not required
# to have an owner. BUT when we create Tasks they need some place to land
class Organization < ActiveRecord::Base

  # Required Stone Path Declarations
  # _____________________________________________________________________
  include StonePath
  stonepath_workbench
  workbench_for :evaluate_proposals
  
end
