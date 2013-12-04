namespace :motosale do

  task :initial_pull => :environment do |cmd|
    @parser = Parsers::Motosale.new

    Proposal::VEHICLE_TYPES.each do |vehicle_type|
      @parser.fetch_list(nil, vehicle_type).each do |info|
        proposal = Proposal.create!(info.merge(vehicle_type: vehicle_type))
        Rails.logger.info "+ #{proposal.title}"
      end
    end

  end

  task :update => :environment do |cmd|
    @parser = Parsers::Motosale.new

    Proposal::VEHICLE_TYPES.each do |vehicle_type|
      page_num = 0
      limit_found = false

      begin
        page_num     += 1

        @list         = @parser.fetch_list(page_num, vehicle_type)

        @fetched_uins = @list.map { |el| el[:uin] }
        @present_uins = Proposal.where(uin: @fetched_uins).pluck(:uin)

        @list.reject { |el| @present_uins.include? el[:uin] }.each do |info|
         proposal = Proposal.create!(info.merge(vehicle_type: vehicle_type))
         Rails.logger.info "+ #{proposal.title}"
        end

      end until @list.empty? || @present_uins.any?

    end

  end

  task :remove_dead => :environment do |cmd|
    @parser = Parsers::Motosale.new
    @list = @parser.fetch_list nil
    Proposal.find_each(batch_size: 200) do |p|

      item = @list.find { |l| l[:uin] == p.uin }

      Rails.logger.info (item.present? ? 'Alive' : 'Dead ') + "  [#{p.uin}] #{p.title}"

      p.destroy if item.blank?
    end
  end

end
