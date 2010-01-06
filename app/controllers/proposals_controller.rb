class ProposalsController < ApplicationController
  before_filter :find_model, :except => [:list, :create]

  # CRUD methods
  # _____________________________________________________________________
  def index
    @proposals = Proposal.find(:all)
  end


  def new
    @proposal = Proposal.new
  end


  def pending
    @proposals = Proposal.pending
  end


  def create
    @proposal = Proposal.create(params[:proposal ])
    @proposal.save!
    redirect_to :action => "show", :id => @proposal.id
  end


  def edit
  end


  def update
    @proposal.update_attributes(params[:proposal])
    redirect_to :action => "show"
  end


  def destroy
    @proposal.destroy
    redirect_to :action => "index"
  end


  def show
  end


  # STONE PATH TASK RELATED METHODS
  # _____________________________________________________________________

  # We need to create the stone path task "Evaluate Proposal" and assign it to a workbench
  # of an Organization
  def send_evaluate_prop
    task = @proposal.evaluate_proposals.create
    task.workbench = Organization.find params[:organization][:organization_id]
    task.save
    redirect_to :action => "pending"
  end


  private
  def find_model
    @proposal = Proposal.find(params[:id]) if params[:id]
  end
end