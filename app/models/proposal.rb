# A Proposal is a proposal from an external party that an internal party accepts
class Proposal < ActiveRecord::Base
  # Required Stone Path Declarations
  # _____________________________________________________________________
  include StonePath    # because this is a Work Item it needs this here, so we have all the stonepath provided stuff
  stonepath_workitem   # need to tell stonepath this is a Work Item

  #owned_by :user      # this proposal was created by (this guy) (an instance of a User). The guy
                      # who is responsible for this thing beyond all else
                      # I'm going to say for this example a Proposal has no owner, but I may change this
                      # (for example, evaluate_proposal may set the owner. RPW 01-05-2010)


  # define the tasks that we need for this model
  # _____________________________________________________________________
  tasked_through :evaluate_proposal   # a proposal can be evaluated by administrative users



  # AASM States
  # _____________________________________________________________________
  aasm_initial_state :pending
  aasm_state :pending       # nobody has seen this proposal yet, an admin needs to take the first action
  aasm_state :in_evaluation # we are working to determine if this proposal is right for us
  aasm_state :accepted      # this proposal is right for us
  aasm_state :kickback      # The submitter should fix this proposal


end