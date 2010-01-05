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
                                      # this gives us a has_many relationship

  task_types = [:evaluate_proposal]   # for the "unassigned_tasks" finder we need this. RPW 01-05-2010
                                      # This is slightly off the StonePath functionality, but
                                      # it came up in discussion so it may be useful

  # AASM States & Events
  # _____________________________________________________________________
  aasm_initial_state :pending
  aasm_state :pending       # nobody has seen this proposal yet, an admin needs to take the first action
  aasm_state :in_evaluation # we are working to determine if this proposal is right for us
  aasm_state :accepted      # this proposal is right for us
  aasm_state :kickback      # The submitter should fix this proposal

  aasm_event :evaluate do
    transitions :to => :in_evaluation, :from => :pending
  end

  aasm_event :accept do
    transitions :to => :accepted, :from => :in_evaluation
  end

  # Finder Methods
  # _____________________________________________________________________

  # First, we get a ton of named scopes, based on our states, from acts as state machine
  # See <http://workswithruby.com/2008/5/acts_as_state_machine-with-auto-named_scope-powers>
  # So that's awesome.
  # Now code we actually have to write...

  # Get all "evaluate proposals" StonePath tasks that are unassigned for this entity
  def unassigned_evaluate_proposals
    self.evaluate_proposal.unassigned  # use a StonePath provided named scopes
  end


  # Get all unassigned Stone Path tasks for this entity
  # StonePath doesn't provide this out of the box, so we need to keep track of
  # our association methods and aggregate them ourselves
  def unassigned_tasks
    output = []
    task_types.each do |association_symbol|
      output << self.send(association_symbol).unassigned
    end
    output
  end

end