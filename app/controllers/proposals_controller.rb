class ProposalsController < ApplicationController

  def index
    @proposals = search_items.limit(50)

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  private

  def search_items
    @proposals = Proposal.all
    if params[:search].present?
      types = params[:search][:vehicle_types].reject{ |i| i.blank? }
      @proposals = @proposals.where(vehicle_type: types) if types.any?
    end
    @proposals
  end
end

