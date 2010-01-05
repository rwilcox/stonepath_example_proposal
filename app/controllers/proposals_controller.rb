class ProposalsController < ApplicationController
  before_filter :find_model, :except => [:list, :create]

  def index
    
  end

  def new
    @proposal = Proposal.new
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

  def show
  end

  private
  def find_model
    @proposal = Proposal.find(params[:id]) if params[:id]
  end
end