class OrganizationsController < ApplicationController
  before_filter :find_model, :except => [:list, :create]

  def index
    @organizations = Organization.find(:all)
  end

  private
  def find_model
    @organization = Organization.find(params[:id]) if params[:id]
  end
  
end