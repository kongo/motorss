class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.limit(50)

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

end

