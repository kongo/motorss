class ProposalsController < ApplicationController

  PAPER_TYPES = {
    'legal'   => 'С документами',
    'illegal' => 'Без документов',
    'na'      => 'Не для ДОП'
  }
  VEHICLE_TYPES_NAMES = Hash[
    Proposal::VEHICLE_TYPES_NAMES.map {|x| [x.first.to_s, x.last]}
  ]

  class Search
    include ActiveModel::Model
    SEARCH_FIELDS = [:vehicle_types, :paper_types]
    attr_accessor *SEARCH_FIELDS

    def initialize(data)
      fields = data.map { |k, v| self.respond_to?(k) ? k : nil }.compact
      super data.slice *fields
    end
  end

  def index
    @search_params = Search.new params[:proposals_controller_search]
    @proposals = search_items(@search_params).limit(50)

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  private

  def search_items(search)
    @proposals = Proposal.scoped
    @proposals
  end
end

