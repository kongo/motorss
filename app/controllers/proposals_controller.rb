class ProposalsController < ApplicationController

  PAPER_TYPES = {
    'legal'   => 'С документами',
    'illegal' => 'Без документов',
    'na'      => 'Не для ДОП'
  }
  VEHICLE_TYPES_NAMES = Hash[
    Proposal::VEHICLE_TYPES_NAMES.map {|x| [x.first.to_s, x.last]}
  ]

  SEARCH_KEY = :proposals_controller_search

  class Search
    include ActiveModel::Model
    SEARCH_FIELDS = [:vehicle_types, :paper_types]
    ARRAY_FIELDS  = [:vehicle_types, :paper_types]
    attr_accessor *SEARCH_FIELDS

    def initialize(data)
      ARRAY_FIELDS.map { |f| send "#{f}=", {} }

      fields = data.map { |k, v| self.respond_to?(k) ? k : nil }.compact

      data = data.slice(*fields).map do |k, v|
        v = v.delete_if(&:empty?) if v.respond_to? :delete_if
        [k, v]
      end

      super data
    end
  end

  def index
    search_params = params[SEARCH_KEY] || session[SEARCH_KEY] || {}
    session[SEARCH_KEY] = search_params

    @search= Search.new search_params
    @proposals = search_items(@search).limit(100)

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  private

  def search_items(search)
    @proposals = Proposal.all

    if search.vehicle_types.any?
      @proposals = @proposals.where(vehicle_type: search.vehicle_types)
    end

    if search.paper_types.any?
      indexes = search.paper_types.map do |i|
        Proposal::PAPER_TYPES_LEGAL_INDEXES[i.to_sym]
      end.flatten

      @proposals = @proposals.where(papers: indexes.map {|i| Proposal::PAPERS_TYPES_NAMES[i] })
    end

    @proposals
  end
end

