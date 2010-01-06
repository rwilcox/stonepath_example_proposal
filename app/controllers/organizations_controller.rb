class OrganizationsController < ApplicationController
  before_filter :find_model, :except => [:list, :create, :edit_task, :mark_task_as_complete]

  def index
    @organizations = Organization.find(:all)
  end


  def edit_task
    @task = EvaluateProposal.find( params[:id] )
    @proposal = @task.workitem
  end


  # This needs to mark a task as complete, and set the 
  def mark_task_as_complete
    @task = EvaluateProposal.find( params[:id] )
    @proposal = Proposal.find(params[:proposal])

    # first, mark our proposal
    if params[:proposal_state] == "accepted"
      @proposal.accept!
    else
      @proposal.reject!
    end

    # and modify the task
    @task.complete
    @task.save
    redirect_to :action => "index"
  end


  private
  def find_model
    @organization = Organization.find(params[:id]) if params[:id]
  end
  
end